//
//  PlainCellModel.swift
//  Identifiable
//
//  Created by Daniel Burke on 1/23/18.
//  Copyright © 2018 Handshake. All rights reserved.
//

import Foundation

struct PlainCellModel: IdentifiableCellModel {
    //IdentifiableCellModel
    var cellIdentifier: String = { return String(describing: PlainCell.self) }()
    var cellClass: AnyClass { return PlainCell.self }
    
    //Other properties
    let labelStr: String
    
    init(label: String) {
        labelStr = label
    }
}
