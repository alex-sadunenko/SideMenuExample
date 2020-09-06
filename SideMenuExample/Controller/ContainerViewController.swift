//
//  ContainerViewController.swift
//  SideMenuExample
//
//  Created by Alex on 04.09.2020.
//  Copyright © 2020 Alex Sadunenko. All rights reserved.
//

import UIKit

class ContainerViewController: UIViewController {

    // MARK: - Properties
    var menuController: MenuViewController!
    var centerController: UIViewController!
    var isExpended = false
    
    // MARK: - Init
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    override var prefersStatusBarHidden: Bool {
        return isExpended
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        configureHomeController()
    }
    // MARK: - Handlers
    
    func configureHomeController() {
        let homeController = HomeViewController()
        homeController.delegate = self
        centerController = UINavigationController(rootViewController: homeController)
        
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    func configureMenuController() {
        if menuController == nil {
            menuController = MenuViewController()
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
            print("Side menu")
        }
    }
    
    func showMenuController(shouldExpand: Bool, menuOption: MenuOption?) {
        if shouldExpand {
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: { [weak self] in
                self?.centerController.view.frame.origin.x = (self?.centerController.view.frame.width)! - 80
            }, completion: nil)
        } else {
            UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                self.centerController.view.frame.origin.x = 0
            }) { [weak self] _ in
                guard let menuOption = menuOption else { return }
                self?.didSelectMenuOption(menuOption: menuOption)
            }
        }
        animateStatusBar()
    }
    
    func didSelectMenuOption(menuOption: MenuOption) {
        switch menuOption {
        case .Profile:
            print("Profile")
        case .Inbox:
            print("Inbox")
        case .Notification:
            print("Notification")
        case .Settings:
            print("Settings")
            
            let settingsVC = SettingsViewController()
            settingsVC.view.backgroundColor = .yellow
            let navigationSettings = UINavigationController(rootViewController: settingsVC)
            navigationSettings.modalPresentationStyle = .fullScreen
            presentDetails(navigationSettings)
            // это встроенный метод, выше используем свой
            //present(navigationSettings, animated: true, completion: nil)
        }
    }
    
    func animateStatusBar() {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: { [weak self] in
            self?.setNeedsStatusBarAppearanceUpdate()
        }, completion: nil)
    }
}

// MARK: - HomeControllerDelegate
extension ContainerViewController: HomeControllerDelegate {
    
    func handleMenuToggle(forMenuOption: MenuOption?) {
        if !isExpended {
            configureMenuController()
        }
        isExpended = !isExpended
        showMenuController(shouldExpand: isExpended, menuOption: forMenuOption)
        // перенес выше
        //guard let menuOption = forMenuOption else { return }
        //didSelectMenuOption(menuOption: menuOption)
    }
    
}
