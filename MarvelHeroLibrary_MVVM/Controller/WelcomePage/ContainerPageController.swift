//
//  ContainerViewController.swift
//  MarvelHeroLibrary_MVVM
//
//  Created by Shawn Li on 5/30/20.
//  Copyright © 2020 ShawnLi. All rights reserved.
//

import UIKit

class ContainerPageController: UIViewController, HomeControllerDelegate
{
    
    var menuController: UIViewController!
    var centerController: UIViewController!
    
    var isExpanded = false
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        configureWelcomeController()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent //What is that?
    }
    
    func configureWelcomeController()
    {

        let welcomeController = self.storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomePageController
        welcomeController.delegate = self
        centerController = UINavigationController(rootViewController: welcomeController)
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }

    func configureMenuController()
    {
        if menuController == nil
        {
            menuController = MenuPageController()
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
        }
    }
    
    func showMenuController(shouldExpand: Bool)
    {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseOut, animations: { self.configureAnimation(shouldExpand: shouldExpand) }, completion: nil)
    }
    
    func configureAnimation(shouldExpand: Bool)
    {
        if shouldExpand
        {
            centerController.view.frame.origin.x = centerController.view.frame.width - 150
        }
        else
        {
            centerController.view.frame.origin.x = 0
        }
    }
    
    // Delegate Method
    
    func handleMenuToggle()
    {
        
        if !isExpanded
        {
            configureMenuController()
        }
        
        isExpanded = !isExpanded
        
        showMenuController(shouldExpand: isExpanded)
    }
}
