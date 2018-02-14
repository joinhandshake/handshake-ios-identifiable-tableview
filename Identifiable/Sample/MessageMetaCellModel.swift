//
//  MessageMetaCellModel.swift
//  Identifiable
//
//  Created by Daniel Burke on 2/14/18.
//  Copyright © 2018 Handshake. All rights reserved.
//

import Foundation

public struct MessageMetaCellModel: IdentifiableCellModel {
    //IdentifiableCellModel
    var cellIdentifier: String = { return String(describing: MessageMetaCell.self) }()
    var cellClass: AnyClass { return MessageMetaCell.self }
    
    //Other properties
    let infoStr: String
    
    init(info: String) {
        infoStr = info
    }
}


