//
//  TableViewController.swift
//  Identifiable
//
//  Created by Daniel Burke on 1/19/18.
//  Copyright © 2018 Handshake. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    var cellModels = [[IdentifiableCellModel]]() {
        didSet {
            registerCells()
            tableView.reloadData()
        }
    }

    let tableView: UITableView
    
    init(style: UITableViewStyle = .plain) {
        tableView = UITableView(frame: .zero, style: style)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        tableView.separatorStyle = .none
        
        //Delegation
        tableView.delegate = self
        tableView.dataSource = self
        
        //Constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
    }
    
    private func registerCells() {
        _ = cellModels.flatMap{ $0 }.map{ model in
            tableView.register(
                model.cellClass,
                forCellReuseIdentifier: model.cellIdentifier
            )
        }
    }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return cellModels.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModels[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = cellModels[indexPath.section][indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.cellIdentifier, for: indexPath)
        
        if let cell = cell as? IdentifiableCell {
            cell.configure(cellModel: cellModel)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
}

