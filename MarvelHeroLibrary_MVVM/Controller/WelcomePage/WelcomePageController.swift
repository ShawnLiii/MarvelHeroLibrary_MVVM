//
//  ViewController.swift
//  MarvelHeroLibrary_MVVM
//
//  Created by Shawn Li on 5/28/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit

class WelcomePageController: UIViewController
{
    var heroViewModel: MarvelHeroViewModel?
    var delegate: HomeControllerDelegate?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        configureNavigationBar()
        configureTabBarController()
        configurePageContent()
        heroViewModel = MarvelHeroViewModel(name: "ironman")
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
    
    func configurePageContent()
    {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        
        //Add Subview
        view.addSubview(imageView)
        //Add constrains
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        imageView.image = UIImage(named: "avengers")
    }
    
    func configureTabBarController()
    {
        
    }
    
}

