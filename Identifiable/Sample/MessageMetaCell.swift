//
//  MessageMetaCell.swift
//  Identifiable
//
//  Created by Daniel Burke on 2/14/18.
//  Copyright © 2018 Handshake. All rights reserved.
//

import UIKit

class MessageMetaCell: UITableViewCell, IdentifiableCell {
    let infoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 10)
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .white
        
        addSubview(infoLabel)
        
        installConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(cellModel: IdentifiableCellModel) {
        guard let cellModel = cellModel as? MessageMetaCellModel else { return }
        infoLabel.text = cellModel.infoStr
    }
    
    private func installConstraints() {
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        infoLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        infoLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
}
