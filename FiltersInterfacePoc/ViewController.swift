//
//  ViewController.swift
//  FiltersInterfacePoc
//
//  Created by Gabriel Pereira on 18/03/20.
//  Copyright © 2020 Gabriel Pereira. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        presentFiltersController()
    }
    
    private func presentFiltersController() {
        let filtersController = UINavigationController(rootViewController: FiltersViewController())
        
        DispatchQueue.main.async {
            self.navigationController?.present(filtersController, animated: true, completion: nil)
        }
    }
    
    @IBAction func presentFilters(_ sender: UIButton) {
        presentFiltersController()
    }
}
