//
//  ViewController.swift
//  FiltersInterfacePoc
//
//  Created by Gabriel Pereira on 18/03/20.
//  Copyright © 2020 Gabriel Pereira. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    // MARK: - Properties
    let filtersSheetViewController: FiltersSheetViewController = FiltersSheetViewController()
    
    private func setupFiltersSheetController() {
        filtersSheetViewController.view.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(filtersSheetViewController.view)
        setupFiltersSheetConstraints()
    }
    
    private func setupFiltersSheetConstraints() {
        NSLayoutConstraint.activate([
            filtersSheetViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            filtersSheetViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            filtersSheetViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            filtersSheetViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    @IBAction func presentFilters(_ sender: UIButton) {
        setupFiltersSheetController()
    }
}
