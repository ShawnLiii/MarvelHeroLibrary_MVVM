//
//  ViewController.swift
//  MarvelHeroLibrary_MVVM
//
//  Created by Shawn Li on 5/28/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController
{

    var delegate: HomeControllerDelegate?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        configureNavigationBar()
    }

    @objc func MenuBtnTapped()
    {
        delegate?.handleMenuToggle()
    }
    
    func configureNavigationBar()
    {
        //Without it, this page will also show tableviewcell. Why????
        view.backgroundColor = .white
        
        navigationController?.navigationBar.barTintColor = .darkGray
        navigationController?.navigationBar.barStyle = .black
        
        navigationItem.title = "Welcome Page"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(MenuBtnTapped))
        navigationItem.leftBarButtonItem?.tintColor = .white
    }
}

