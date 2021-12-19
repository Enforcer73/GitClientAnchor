//
//  CustomTextField.swift
//  GitClientAnchor
//
//  Created by Ruslan Bagautdinov on 10.12.2021.
//  Copyright © 2021 Ruslan Bagautdinov. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ placeholder: String, secureText: Bool) {
        isSecureTextEntry = secureText
        attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [ .foregroundColor: UIColor.gray ]
        )
    }
}

extension CustomTextField {
    
    func setupUI() {
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 20))
        leftView = paddingView
        leftViewMode = .always
        font = UIFont.systemFont(ofSize: 17)
        backgroundColor = .clear
    }
}
