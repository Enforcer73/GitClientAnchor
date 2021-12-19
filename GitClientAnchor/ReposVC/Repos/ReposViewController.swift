//
//  ReposViewController.swift
//  GitClientAnchor
//
//  Created by Ruslan Bagautdinov on 12.12.2021.
//  Copyright © 2021 Ruslan Bagautdinov. All rights reserved.
//

import UIKit
import FirebaseAuth

class ReposViewController: UIViewController {

    private var data = Database.shared.data
    private var reposData: ReposTableModel?
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = colorTable
        view.addSubview(tableView)
        setTableView()
        tableViewLayout()
        tableView.backgroundColor = colorTable
        setNavigationBar()
    }
    
    private func setNavigationBar() {
        title = "Repositories"
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
    
    private func setTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ReposTableViewCell.self, forCellReuseIdentifier: "ReposTableViewCell")
        tableView.separatorStyle = .none
    }
    
    private func tableViewLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension ReposViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ReposTableViewCell", for: indexPath) as? ReposTableViewCell {
            cell.setCell(model: data[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        reposData = data[indexPath.row]
    }
}

//MARK: - Actions
private extension ReposViewController {
    
    @objc func signOutButton(sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
        dismiss(animated: true, completion: nil)
    }
    
    @objc func goButton() {
        let detailVC = DetailViewController()
        navigationController?.pushViewController(detailVC, animated: true)
        detailVC.modalPresentationStyle = .fullScreen
        print("Ok")
    }
}
