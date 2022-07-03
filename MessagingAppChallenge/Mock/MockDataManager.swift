//
//  MockDataManager.swift
//  MessagingAppChallenge
//
//  Created by Marc Stroebel on 3/7/2022.
//

import Foundation

class MockDataManager {
    private var messages: [MessageModel]
    
    var onMessagesUpdated: (([MessageModel]) -> Void)?
    
    init() {
        messages = [
            MessageModel(id: "1", text: "message1"),
            MessageModel(id: "2", text: "message2"),
            MessageModel(id: "3", text: "message3")
        ]
    }
}

extension MockDataManager: DataManagerProtocol {
    func fetchData() -> [MessageModel] {
        return self.messages
    }
}
