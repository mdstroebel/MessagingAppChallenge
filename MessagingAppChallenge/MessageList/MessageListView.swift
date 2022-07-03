//
//  MessageListView.swift
//  MessagingAppChallenge
//
//  Created by Marc Stroebel on 3/7/2022.
//

import SwiftUI

struct MessageListView: View {
    @ObservedObject var viewModel = MessageListViewModel()
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.messages) { message in
                    MessageView(message: message)
                }
            }
            .navigationBarTitle(Text("Message List"))
        }
        .onAppear {
            self.viewModel.fetchMessages()
        }
    }
}

struct MessageListView_Previews: PreviewProvider {
    static var previews: some View {
        var view = MessageListView()
        view.viewModel = MessageListViewModel(dataManager: MockDataManager())
        return view
    }
}
