//
//  FiltersViewController.swift
//  FiltersInterfacePoc
//
//  Created by Gabriel Pereira on 18/03/20.
//  Copyright © 2020 Gabriel Pereira. All rights reserved.
//

import UIKit

final class FiltersViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBarButtonItem()
        registerCells()
    }
    
    override func loadView() {
        super.loadView()
        view = tableView
    }
    
    private func registerCells() {
        tableView.register(FiltersTableViewCell.self, forCellReuseIdentifier: String(describing: FiltersTableViewCell.self))
    }
    
    private func setupBarButtonItem() {
        let closeScreenButton = UIBarButtonItem(barButtonSystemItem: .close, target: nil, action: nil)
        let titleButton = UIBarButtonItem(title: "Refinar", style: .done, target: nil, action: nil)
        
        self.navigationItem.leftBarButtonItems = [closeScreenButton, titleButton]
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Limpar todos", style: .done, target: nil, action: nil)
    }
}

// MARK: - UITableViewDelegate and UITableViewDataSource
extension FiltersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view: FiltersHeaderFooterView = FiltersHeaderFooterView(frame: .zero)
            view.fill(withTitle: "Tamanho", color: .black)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view: FiltersHeaderFooterView = FiltersHeaderFooterView(frame: .zero)
            view.fill(withTitle: "Ver todos", color: .blue, textAlignment: .right)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 75
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FiltersTableViewCell.self), for: indexPath) as? FiltersTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
}
