//
//  OtherMessageCell.swift
//  Identifiable
//
//  Created by Daniel Burke on 2/14/18.
//  Copyright © 2018 Handshake. All rights reserved.
//

import UIKit

class OtherMessageCell: UITableViewCell, IdentifiableCell {
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    let commentTextView: UITextView = {
        let textView = UITextView()
        textView.textColor = .white
        textView.backgroundColor = UIColor.gray.withAlphaComponent(0.7)
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.layer.cornerRadius = 6
        return textView
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .lightGray
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        
        addSubview(nameLabel)
        addSubview(commentTextView)
        addSubview(timeLabel)
        
        installConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(cellModel: IdentifiableCellModel) {
        guard let cellModel = cellModel as? OtherMessageCellModel else { return }
        nameLabel.text = cellModel.nameStr
        commentTextView.text = cellModel.commentStr
        timeLabel.text = cellModel.timeStr
    }
    
    private func installConstraints() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        commentTextView.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        
        commentTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        commentTextView.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5).isActive = true
        commentTextView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40).isActive = true
        
        timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        timeLabel.topAnchor.constraint(equalTo: commentTextView.bottomAnchor, constant: 5).isActive = true
        timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        timeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }
}


