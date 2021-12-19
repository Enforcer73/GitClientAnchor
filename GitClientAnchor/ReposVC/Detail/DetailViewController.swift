//
//  DetailViewController.swift
//  GitClientAnchor
//
//  Created by Ruslan Bagautdinov on 13.12.2021.
//  Copyright © 2021 Ruslan Bagautdinov. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = colorTable
        setNavigationBar()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.popViewController(animated: true)
    }
    
    private func setNavigationBar() {
        title = "Detail Repositories"
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [
            .foregroundColor : UIColor.black
        ]
    }

}
