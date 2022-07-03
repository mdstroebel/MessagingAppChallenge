//
//  MessageView.swift
//  MessagingAppChallenge
//
//  Created by Marc Stroebel on 3/7/2022.
//

import SwiftUI

struct MessageView: View {
    private var message: MessageModel
    
    init(message: MessageModel) {
        self.message = message
    }
    
    var body: some View {
        Text(self.message.text)
    }
}
