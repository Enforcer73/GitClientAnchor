//
//  ReposTableViewCell.swift
//  GitClientAnchor
//
//  Created by Ruslan Bagautdinov on 16.12.2021.
//  Copyright © 2021 Ruslan Bagautdinov. All rights reserved.
//

import UIKit

class ReposTableViewCell: UITableViewCell {

    private let tableView = UITableView()
        
    //MARK: - Properties
    private let containerView: UIView = {
        let view = UIView()
        view.backgroundColor = colorBackground
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imagesView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 30
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let loginLabel: CustomLabel = {
        let label = CustomLabel()
        label.configure(with: .boldSystemFont(ofSize: 20),
                        color: .black ,
                        textAlignment: .left,
                        ofLine: 1
        )
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let repoNameLabel: CustomLabel = {
        let label = CustomLabel()
        label.configure(with: .boldSystemFont(ofSize: 18),
                        color: .darkGray,
                        textAlignment: .left,
                        ofLine: 1
        )
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let languageLabel: CustomLabel = {
        let label = CustomLabel()
        label.configure(with: .boldSystemFont(ofSize: 15),
                        color: #colorLiteral(
                            red: 0.462745098,
                            green: 0.6235294118,
                            blue: 0.8039215686,
                            alpha: 1),
                        textAlignment: .center,
                        ofLine: 1
        )
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let forkLabel: CustomLabel = {
       let label = CustomLabel()
        label.configure(with: .boldSystemFont(ofSize: 15),
                        color: #colorLiteral(
                            red: 0.462745098,
                            green: 0.6235294118,
                            blue: 0.8039215686,
                            alpha: 1),
                        textAlignment: .center,
                        ofLine: 1
        )
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let starLabel: CustomLabel = {
       let label = CustomLabel()
        label.configure(with: .boldSystemFont(ofSize: 15),
                        color: #colorLiteral(
                            red: 0.462745098,
                            green: 0.6235294118,
                            blue: 0.8039215686,
                            alpha: 1),
                        textAlignment: .center,
                        ofLine: 1
        )
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptLabel: CustomLabel = {
        let label = CustomLabel()
        label.configure(with: .systemFont(ofSize: 16),
                        color: .black,
                        textAlignment: .left,
                        ofLine: 0
        )
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setCell(model: ReposTableModel) {
        imagesView.image = model.image
        loginLabel.text = model.login
        repoNameLabel.text = model.reposName
        languageLabel.text = model.language
        forkLabel.text = "\(model.fork) forks"
        starLabel.text = "\(model.star) stars"
        descriptLabel.text = model.descript
    }
}

//MARK: - Setting layouts
private extension ReposTableViewCell {
    
    func initialize() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        selectedBackgroundView?.layer.cornerRadius = 10
        addingSubview()
        contentLayout()
    }
    
    func addingSubview() {
        contentView.addSubview(containerView)
        containerView.addSubview(imagesView)
        containerView.addSubview(loginLabel)
        containerView.addSubview(repoNameLabel)
        containerView.addSubview(stackView)
        containerView.addSubview(languageLabel)
        containerView.addSubview(forkLabel)
        containerView.addSubview(starLabel)
        containerView.addSubview(descriptLabel)
        
        stackView.addArrangedSubview(languageLabel)
        stackView.addArrangedSubview(forkLabel)
        stackView.addArrangedSubview(starLabel)
    }
    
    func contentLayout() {
        NSLayoutConstraint.activate([
            
            // - Container
            containerView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 2.5),
            containerView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 3),
            containerView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -3),
            containerView.bottomAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.bottomAnchor, constant: -2.5),
            
            // - ImageView
            imagesView.topAnchor .constraint(equalTo: containerView.topAnchor, constant: 10),
            imagesView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            imagesView.heightAnchor.constraint(equalToConstant: 60),
            imagesView.widthAnchor.constraint(equalToConstant: 60),
            
            // - Login label
            loginLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15),
            loginLabel.leadingAnchor.constraint(equalTo: imagesView.trailingAnchor, constant: 15),
            loginLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            
            // - Repo name label
            repoNameLabel.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 5),
            repoNameLabel.leadingAnchor.constraint(equalTo: imagesView.trailingAnchor, constant: 15),
            repoNameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            
            // - StackView
            stackView.topAnchor.constraint(equalTo: imagesView.bottomAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: descriptLabel.topAnchor, constant: -10),
            
            // - Stack contents labels
            languageLabel.heightAnchor.constraint(equalToConstant: 15),
            forkLabel.heightAnchor.constraint(equalToConstant: 15),
            starLabel.heightAnchor.constraint(equalToConstant: 15),
            
            // - Description label
            descriptLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 15),
            descriptLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            descriptLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),
        ])
    }
}
