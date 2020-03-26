//
//  FiltersCollectionViewCell.swift
//  FiltersInterfacePoc
//
//  Created by Gabriel Pereira on 18/03/20.
//  Copyright © 2020 Gabriel Pereira. All rights reserved.
//

import UIKit

final class FiltersCollectionViewCell: UICollectionViewCell {
    // MARK: - UI Components
    private lazy var filterTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .blue
        
        return label
    }()
    
    // MARK: - Override Methods
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupViews()
        setupCellLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public and Internal Methods
    func fill(usingTitle title: String) {
        filterTitleLabel.text = title
    }
    
    // MARK: - Private Methods
    private func setupCellLayout() {
        contentView.layer.cornerRadius = 4
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.blue.cgColor
    }
}

extension FiltersCollectionViewCell: ViewCode {
    func setupViewHierarchy() {
        contentView.addSubview(filterTitleLabel)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            filterTitleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            filterTitleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            filterTitleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            filterTitleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
    }
}
