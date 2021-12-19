//
//  FavoriteViewController.swift
//  GitClientAnchor
//
//  Created by Ruslan Bagautdinov on 12.12.2021.
//  Copyright © 2021 Ruslan Bagautdinov. All rights reserved.
//

import UIKit
import FirebaseAuth

class FavoriteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = colorTable
        setNavigationBar()
    }
    
    private func setNavigationBar() {
        title = "Favorite"
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            .foregroundColor : UIColor.black
        ]
        
        let signOutButton = UIBarButtonItem(
            title: "Sign Out",
            style: UIBarButtonItem.Style.done,
            target: self,
            action: #selector(signOutButton)
        )
        
        let goButton = UIBarButtonItem(
            title: "Go",
            style: UIBarButtonItem.Style.done,
            target: self,
            action: #selector(goButton)
        )
        navigationItem.leftBarButtonItem = signOutButton
        navigationItem.rightBarButtonItem = goButton
    }
}

//MARK: - Actions
private extension FavoriteViewController {
    
    @objc func signOutButton(sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
        dismiss(animated: true, completion: nil)
    }
    
    @objc func goButton() {
        let detailVC = FavoriteDetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)
        detailVC.modalPresentationStyle = .fullScreen
        print("Ok")
    }
}
