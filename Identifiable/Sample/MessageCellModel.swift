//
//  MessageCellModel.swift
//  Identifiable
//
//  Created by Daniel Burke on 1/23/18.
//  Copyright © 2018 Handshake. All rights reserved.
//

import Foundation

struct MessageCellModel: IdentifiableCellModel {
    //IdentifiableCellModel
    var cellIdentifier: String = { return String(describing: MessageCell.self) }()
    var cellClass: AnyClass { return MessageCell.self }
    
    //Other properties
    let nameStr: String
    let commentStr: String
    let timeStr: String
    
    init(name: String, comment: String, time: Date) {
        nameStr = name
        commentStr = comment
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd HH:mm"
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        
        timeStr = formatter.string(from: time)
    }
}
