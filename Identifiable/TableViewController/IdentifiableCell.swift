//
//  IdentifiableCell.swift
//  Identifiable
//
//  Created by Daniel Burke on 1/23/18.
//  Copyright © 2018 Handshake. All rights reserved.
//

import Foundation

protocol IdentifiableCell {
    func configure(cellModel: IdentifiableCellModel)
}

protocol IdentifiableCellModel {
    var cellIdentifier: String { get }
    var cellClass: AnyClass { get }
}
