//
//  CustomTabBar.swift
//  GitClientAnchor
//
//  Created by Ruslan Bagautdinov on 12.12.2021.
//  Copyright © 2021 Ruslan Bagautdinov. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {

    let reposVC = UINavigationController(rootViewController:ReposViewController())
    let favoritVC = UINavigationController(rootViewController:FavoriteViewController())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UINavigationBar.appearance().backgroundColor = colorTable
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
        
        
        self.setViewControllers([reposVC, favoritVC], animated: true )
        self.tabBar.tintColor = .black
        self.tabBar.backgroundColor = colorTable
        
        reposVC.title = "Repositories"
        favoritVC.title = "Favorites"
        
        guard let items = self.tabBar.items else { return }

        let images = ["tablecells", "star"]

        for (index, element) in items.enumerated() {
          element.image = UIImage(systemName: images[index])
        }
    }
}
