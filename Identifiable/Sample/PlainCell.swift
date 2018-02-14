//
//  PlainCell.swift
//  Identifiable
//
//  Created by Daniel Burke on 1/23/18.
//  Copyright © 2018 Handshake. All rights reserved.
//

import UIKit

class PlainCell: UITableViewCell, IdentifiableCell {
    let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubview(label)
        installConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(cellModel: IdentifiableCellModel) {
        guard let cellModel = cellModel as? PlainCellModel else { return }
        label.text = cellModel.labelStr
    }
    
    private func installConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        label.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }
}
