//
//  MenuViewController.swift
//  MarvelHeroLibrary_MVVM
//
//  Created by Shawn Li on 5/30/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit

class MenuPageController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    var tableView: UITableView!
    var menuBarViewModel: MenuViewModel?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        menuBarViewModel = MenuViewModel()
        configureTableView()
    }
    
    func configureTableView()
    {
        tableView = UITableView()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ManuOptionsCell.self, forCellReuseIdentifier: AppContains.StoryBoardContains.menuCellID)
        tableView.backgroundColor = .darkGray
        tableView.separatorStyle = .none
        tableView.rowHeight = 80
        //add subView
        view.addSubview(tableView)
        // add Contrains
        tableView.translatesAutoresizingMaskIntoConstraints = false // close inferenced constrains
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return MenuOptions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: AppContains.StoryBoardContains.menuCellID, for: indexPath) as! ManuOptionsCell
        
        cell.optionsLabel.text = MenuOptions.allCases[indexPath.row].rawValue
        cell.iconImageView.image = MenuOptions.allCases[indexPath.row].iconImage
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
