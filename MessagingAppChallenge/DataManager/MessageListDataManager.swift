//
//  MessageListDataManager.swift
//  MessagingAppChallenge
//
//  Created by Marc Stroebel on 3/7/2022.
//

import Foundation
import MarcsMessageWebSocketClient

protocol DataManagerProtocol {
    var onMessagesUpdated: (([MessageModel]) -> Void)? { get set }
    func fetchData() -> [MessageModel]
}

class MessageListDataManager {
    static let shared: DataManagerProtocol = MessageListDataManager()
    
    private var webSocketClient: MessageWebSocketClientProtocol
    private var messages = [MessageModel]()
    
    var onMessagesUpdated: (([MessageModel]) -> Void)?
    
    private init(client: MessageWebSocketClientProtocol = MessageWebSocketClientUrlSession(socketUrl: "wss://socketsbay.com/wss/v2/2/demo/")) {
        webSocketClient = client
        webSocketClient.subscribeToMessages(with: { [weak self] message in
            guard let self = self else {
                return
            }
            let newMessage = MessageModel(id: message, text: message)
            self.messages.append(newMessage)
            self.onMessagesUpdated?(self.messages)
        })
    }
}

extension MessageListDataManager: DataManagerProtocol {
    func fetchData() -> [MessageModel] {
        return messages
    }
}
