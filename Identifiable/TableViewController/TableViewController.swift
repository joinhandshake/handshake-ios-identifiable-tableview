//
//  TableViewController.swift
//  Pairing-Feed
//
//  Created by Daniel Burke on 1/1/18.
//  Copyright © 2018 Daniel Burke. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    var sections = [TableViewSection]() {
        didSet {
            registerCells()
            tableView.reloadData()
        }
    }
    
    let tableView: UITableView
    
    init(style: UITableViewStyle = .grouped) {
        tableView = UITableView(frame: .zero, style: style)
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        
        tableView.rowHeight = UITableViewAutomaticDimension
        
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
        sections.forEach({ section in
            section.cellModels.forEach{ tableView.register($0.cellClass, forCellReuseIdentifier: $0.cellIdentifier) }
            if let header = section.headerCellModel {
                tableView.register(header.cellClass, forCellReuseIdentifier: header.cellIdentifier)
            }
            if let footer = section.footerCellModel {
                tableView.register(footer.cellClass, forCellReuseIdentifier: footer.cellIdentifier)
            }
        })
    }
}

extension TableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return sections[section].headerCellModel == nil ? 0.00001 : UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return sections[section].footerCellModel == nil ? 0.00001 : UITableViewAutomaticDimension
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].cellModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = sections[indexPath.section].cellModels[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.cellIdentifier, for: indexPath)
        
        if let cell = cell as? IdentifiableCell {
            cell.configure(cellModel: cellModel)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Subclass must override this
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard
            let headerCellModel = sections[section].headerCellModel,
            let cell = tableView.dequeueReusableCell(withIdentifier: headerCellModel.cellIdentifier)
            else { return nil }
        
        if let cell = cell as? IdentifiableCell {
            cell.configure(cellModel: headerCellModel)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard
            let footerCellModel = sections[section].footerCellModel,
            let cell = tableView.dequeueReusableCell(withIdentifier: footerCellModel.cellIdentifier)
            else { return nil }
        
        if let cell = cell as? IdentifiableCell {
            cell.configure(cellModel: footerCellModel)
        }
        
        return cell
    }
    
}
