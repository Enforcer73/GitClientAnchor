//
//  CustomLabel.swift
//  GitClientAnchor
//
//  Created by Ruslan Bagautdinov on 10.12.2021.
//  Copyright © 2021 Ruslan Bagautdinov. All rights reserved.
//

import UIKit

class CustomLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with font: UIFont, color: UIColor, textAlignment: NSTextAlignment, ofLine: Int) {
        text = ""
        textColor = color
        self.font = font
        self.textAlignment = textAlignment
        numberOfLines = ofLine
    }
}

extension CustomLabel {
    
    func setupUI() {
        text = ""
        textColor = .black
        font = .systemFont(ofSize: 15)
        textAlignment = .left
        numberOfLines = 1
    }
}
