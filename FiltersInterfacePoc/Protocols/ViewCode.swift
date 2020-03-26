//
//  ViewCode.swift
//  FiltersInterfacePoc
//
//  Created by Gabriel Pereira on 18/03/20.
//  Copyright © 2020 Gabriel Pereira. All rights reserved.
//

protocol ViewCode {
    func setupViews()
    func setupViewHierarchy()
    func setupConstraints()
}

extension ViewCode {
    func setupViews() {
        setupViewHierarchy()
        setupConstraints()
    }
}
