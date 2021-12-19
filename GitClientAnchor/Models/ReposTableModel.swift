//
//  ReposTableModel.swift
//  GitClientAnchor
//
//  Created by Ruslan Bagautdinov on 10.12.2021.
//  Copyright © 2021 Ruslan Bagautdinov. All rights reserved.
//

import UIKit

class ReposTableModel {
    var image: UIImage?
    var login: String
    var reposName: String
    var descript: String
    var language: String
    var fork: Int
    var star: Int
    
    init(image: String = "unknown", login: String, reposName: String, descript: String, language: String, fork: Int, star: Int) {
        self.image = UIImage(named: image) ?? UIImage(named: "unknown")
        self.login = login
        self.reposName = reposName
        self.descript = descript
        self.language = language
        self.fork = fork
        self.star = star
    }
}
