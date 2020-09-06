//
//  MenuViewController.swift
//  SideMenuExample
//
//  Created by Alex on 04.09.2020.
//  Copyright © 2020 Alex Sadunenko. All rights reserved.
//

import UIKit

//private let reuseIdentifier = "MenuOptionCell"

class MenuViewController: UIViewController {

    // MARK: - Constants
    
    //enum Constants: String {
    //    case MenuOptionCell
    //}
    
    private struct Constants {
        let reuseIdentifier = "MenuOptionCell"
    }

    // MARK: - Properties
    
    var tableView: UITableView!
    var delegate: HomeControllerDelegate?
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        configureTableView()
        
    }
    
    // MARK: - Handlers
    
    func configureTableView() {
        let constants = Constants()
        
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(MenuOptionTableViewCell.self, forCellReuseIdentifier: constants.reuseIdentifier)
        tableView.backgroundColor = .darkGray
        tableView.separatorStyle = .none
        tableView.rowHeight = 80
        //tableView.allowsSelection = false
        //tableView.isScrollEnabled = false

        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }

}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let constants = Constants()
        let menuOption = MenuOption(rawValue: indexPath.row)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: constants.reuseIdentifier, for: indexPath) as! MenuOptionTableViewCell
        cell.descriptionLabel.text = menuOption?.description
        cell.iconImageView.image = menuOption?.image
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let menuOption = MenuOption(rawValue: indexPath.row)
        delegate?.handleMenuToggle(forMenuOption: menuOption)
    }
}
