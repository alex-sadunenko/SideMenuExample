//
//  SettingsViewController.swift
//  SideMenuExample
//
//  Created by Alex on 05.09.2020.
//  Copyright © 2020 Alex Sadunenko. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureNavigationBar()
    }
    
    // MARK: - Handlers
    @objc func handlerDismiss() {
        dismissDetails()
        //встроенный метод, выше используем свой
        //dismiss(animated: true, completion: nil)
    }
    
    func configureNavigationBar() {
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .default
        navigationItem.title = "Settings"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(handlerDismiss))
    }
    
}
