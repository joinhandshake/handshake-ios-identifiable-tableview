//
//  TableViewSection.swift
//  Identifiable
//
//  Created by Zach Wyzgoski on 2/20/18.
//  Copyright © 2018 Handshake. All rights reserved.
//

struct TableViewSection {
    let cellModels: [IdentifiableCellModel]
    let headerCellModel: IdentifiableCellModel?
    let footerCellModel: IdentifiableCellModel?
    
    init(cellModels: [IdentifiableCellModel],
         headerCellModel: IdentifiableCellModel? = nil,
         footerCellModel: IdentifiableCellModel? = nil) {
        
        self.cellModels = cellModels
        self.headerCellModel = headerCellModel
        self.footerCellModel = footerCellModel
    }
}
