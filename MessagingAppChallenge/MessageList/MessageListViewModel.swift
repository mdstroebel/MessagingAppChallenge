//
//  MessageListViewModel.swift
//  MessagingAppChallenge
//
//  Created by Marc Stroebel on 3/7/2022.
//

import SwiftUI

protocol MessageListViewModelProtocol {
    func fetchMessages()
}

class MessageListViewModel: ObservableObject {
    private var dataManager: DataManagerProtocol
    
    @Published var messages: [MessageModel] = []
    
    init(dataManager: DataManagerProtocol = MessageListDataManager.shared) {
        self.dataManager = dataManager
        self.fetchMessages()
        self.dataManager.onMessagesUpdated = { messages in
            DispatchQueue.main.async {
                self.messages = messages
            }
        }
    }
}

extension MessageListViewModel: MessageListViewModelProtocol {
    func fetchMessages() {
        messages = self.dataManager.fetchData()
    }
}
