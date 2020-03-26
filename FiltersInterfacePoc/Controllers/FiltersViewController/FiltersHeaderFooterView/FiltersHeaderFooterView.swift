//
//  FiltersHeaderFooterView.swift
//  FiltersInterfacePoc
//
//  Created by Gabriel Pereira on 18/03/20.
//  Copyright © 2020 Gabriel Pereira. All rights reserved.
//

import UIKit

final class FiltersHeaderFooterView: UIView {
    private lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        
        return label
    }()
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func fill(withTitle title: String, color: UIColor, textAlignment: NSTextAlignment = .left) {
        titleLabel.text = title
        titleLabel.textColor = color
        titleLabel.textAlignment = textAlignment
    }
}

extension FiltersHeaderFooterView: ViewCode {
    func setupViewHierarchy() {
        addSubview(titleLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16)
        ])
    }
}
