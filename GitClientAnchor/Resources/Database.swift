//
//  Database.swift
//  GitClientAnchor
//
//  Created by Ruslan Bagautdinov on 10.12.2021.
//  Copyright © 2021 Ruslan Bagautdinov. All rights reserved.
//

import UIKit

class Database {
    
    static var shared = Database()
        
    lazy var data: [ReposTableModel] = [
        ("valak", "Enforcer", "lesson", "terwtwertew ertwertwrw wetdgsdf gsdf hjjh hj jhjkk h kh khkwrwrwe wr wr wrwrwerwrgfdhdh hk rwerwjhhkjh", "swift", 1, 2),
        ("ava", "GitHub", "app", "ertwertwetdgsdfgsdf", "ruby", 3, 1),
        ("valak", "Enforcer", "lesson", "terwtwertew ertwertwrw wetdgsdf", "swift", 1, 2),
        ("ava", "GitHub", "app", "ertwertwetdgsdfgsdf", "ruby", 3, 1),
        ("valak", "Enforcer", "lesson", "terwtwertew ertwertwrw wetdgsdf gsdf hjjh hj ", "swift", 1, 2),
        ("ava", "GitHub", "app", "ertwertwetdgsdfgsdf", "ruby", 3, 1),
        ("ava", "GitHub", "app", "ertwertwetdgsdfgsdf", "ruby", 3, 1),
        ("valak", "Enforcer", "lesson", "terwtwertew ertwertwrw wetdgsdf", "swift", 1, 2),
        ("ava", "GitHub", "app", "ertwertwetdgsdfgsdf", "ruby", 3, 1),
        ("valak", "Enforcer", "lesson", "terwtwertew ertwertwrw wetdgsdf gsdf hjjh hj ", "swift", 1, 2),
        ("ava", "GitHub", "app", "ertwertwetdgsdfgsdf", "ruby", 3, 1)
    ].map { (image, login, reposName, descript, language, fork, star) -> ReposTableModel in
    
        let data = ReposTableModel(image: image, login: login, reposName: reposName, descript: descript, language: language, fork: fork, star: star)
        
        return data
    }
    
    lazy var commits: [DetailTableModel] = [
        ("buh", "Sunduk Kuznecov", "Buh",  "15.07.2021", "sdafkh sdh uiweru  ksfhlks fsdfsdfsdf f... ddddddd ssd ddsdsd dssddsdsd ds"),
        ("valak", "Vasya Pupkin", "Tatarin",  "26.11.2021", "good! not errors..."),
        ("ava", "Jamshut Zelimhanov", "Jujaa",  "01.01.2020", "shnyaga shnyajnaya! hren polnaya... ddddddd ssd ddsdsd dssddsdsd ds"),
        ("buh", "Sunduk Kuznecov", "Buh",  "15.07.2021", "sdafkh sdh uiweru  ksfhlks fsdfsdfsdf f... ddddddd ssd ddsdsd dssddsdsd ds"),
        ("valak", "Vasya Pupkin", "Tatarin",  "26.11.2021", "good! not errors..."),
        ("ava", "Jamshut Zelimhanov", "Jujaa",  "01.01.2020", "shnyaga shnyajnaya! hren polnaya... ddddddd ssd ddsdsd dssddsdsd ds"),
        ("buh", "Sunduk Kuznecov", "Buh",  "15.07.2021", "sdafkh sdh uiweru  ksfhlks fsdfsdfsdf f... ddddddd ssd ddsdsd dssddsdsd ds"),
        ("valak", "Vasya Pupkin", "Tatarin",  "26.11.2021", "good! not errors..."),
        ("ava", "Jamshut Zelimhanov", "Jujaa",  "01.01.2020", "shnyaga shnyajnaya! hren polnaya... ddddddd ssd ddsdsd dssddsdsd ds")
    ].map { (image, fullName, login, date, commits) -> DetailTableModel in
    
        let commits = DetailTableModel(image: image, login: login, fullName: fullName, date: date, commits: commits)
        
        return commits
    }
    
    private init() {}
}
