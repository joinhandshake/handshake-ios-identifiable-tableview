//
//  ConversationViewController.swift
//  Identifiable
//
//  Created by Daniel Burke on 2/14/18.
//  Copyright © 2018 Handshake. All rights reserved.
//

import UIKit

class ConversationViewController: TableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cellModels = [
            [
                PlainCellModel(label: "It’s important to use cocoa butter. It’s the key to more success, why not live smooth? Why live rough? Life is what you make it, so let’s make it. The key is to enjoy life, because they don’t want you to enjoy life."),
                PlainCellModel(label: "They don’t want us to win. It’s on you how you want to live your life. Everyone has a choice.")
            ],
            [
                MessageCellModel(name: "Daniel", comment: "The first of the month is coming, we have to get money, we have no choice. It cost money to eat and they don’t want you to eat. They don’t want us to eat.", time: Date()),
                OtherMessageCellModel(name: "Heather", comment: "Life is what you make it, so let’s make it. You should never complain, complaining is a weak emotion, you got life, we breathing, we blessed.", time: Date()),
                OtherMessageCellModel(name: "Heather", comment: "A major key, never panic. Don’t panic, when it gets crazy and rough, don’t panic, stay calm.", time: Date()),
                MessageMetaCellModel(info: "Yesterday at 12:32pm"),
                MessageCellModel(name: "Daniel", comment: "The first of the month is coming, we have to get money, we have no choice. It cost money to eat and they don’t want you to eat. They don’t want us to eat.", time: Date()),
                OtherMessageCellModel(name: "Heather", comment: "Life is what you make it, so let’s make it. You should never complain, complaining is a weak emotion, you got life, we breathing, we blessed.", time: Date()),
                OtherMessageCellModel(name: "Heather", comment: "A major key, never panic. Don’t panic, when it gets crazy and rough, don’t panic, stay calm.", time: Date())
            ]
        ]
    }
}
