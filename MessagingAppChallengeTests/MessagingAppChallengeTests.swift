//
//  MessagingAppChallengeTests.swift
//  MessagingAppChallengeTests
//
//  Created by Marc Stroebel on 3/7/2022.
//

import XCTest
@testable import MessagingAppChallenge

class MessagingAppChallengeTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMessageListVieWModelRetrievalOfMessages() throws {
        let listViewModel = MessageListViewModel(dataManager: MockDataManager())
        listViewModel.fetchMessages()
        assert(listViewModel.messages.count == 3)
    }
    
    // We could put more test cases here for future functionality of the view model and/or datamanager, such as
    // - add/create message
    // - delete message
    // - archive message
    // etc

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
