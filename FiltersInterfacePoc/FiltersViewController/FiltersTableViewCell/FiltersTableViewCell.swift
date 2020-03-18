//
//  FiltersTableViewCell.swift
//  FiltersInterfacePoc
//
//  Created by Gabriel Pereira on 18/03/20.
//  Copyright © 2020 Gabriel Pereira. All rights reserved.
//

import UIKit

final class FiltersTableViewCell: UITableViewCell {
    // MARK: - Properties
//    private let sizes: [Int] = [34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48]
//    private let sizes: [String] = ["Acessórios", "Marcas", "Camisetas", "Bermudas", "Blusas", "Bermudas"]
    private let sizes: [String] = ["Menos de R$ 50", "R$ 50 - R$ 90", "R$ 90 - 140", "R$ 140 - R$ 220", "R$ 220 - R$ 300", "R$ 300 - R$ 350", "R$ 350 - R$ 400"]
    
    // MARK: - UI Components
    private lazy var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
            collectionViewLayout.scrollDirection = .vertical
            collectionViewLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
            collectionViewLayout.minimumInteritemSpacing = 8
            collectionViewLayout.minimumLineSpacing = 8
            collectionViewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.backgroundColor = .clear
            collectionView.isScrollEnabled = false

        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupCollectionViewCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupCollectionViewCell() {
        collectionView.register(FiltersCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: FiltersCollectionViewCell.self))
    }
}

// MARK: - UICollectionViewDelegate and UICollectionViewDataSource
extension FiltersTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sizes.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: FiltersCollectionViewCell.self), for: indexPath) as? FiltersCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.fill(usingTitle: "\(sizes[indexPath.row])")
        
        return cell
    }
}

// MARK: - View Code Methods
extension FiltersTableViewCell: ViewCode {
    func setupViewHierarchy() {
        contentView.addSubview(collectionView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
}
