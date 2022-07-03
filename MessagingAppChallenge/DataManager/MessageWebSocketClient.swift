//
//  MessageWebSocketClient.swift
//  MessagingAppChallenge
//
//  Created by Marc Stroebel on 3/7/2022.
//

import Foundation

protocol MessageWebSocketClientProtocol {
    func subscribeToMessages(with completion: @escaping (String) -> Void)
}

public class MessageWebSocketClient: NSObject {
    static let shared = MessageWebSocketClient()
    
    private var webSocket: URLSessionWebSocketTask?
    private var urlString: String = "ws://localhost:8080"
    
    private override init() {}
    
    public init(socketUrl: String = "ws://localhost:8080") {
        super.init()
        urlString = socketUrl
        createSocketConnection()
    }
    
    private func createSocketConnection() {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            let session = URLSession(configuration: .default, delegate: self, delegateQueue: nil)
            let webSocket = session.webSocketTask(with: request)
            self.webSocket = webSocket
            self.webSocket?.resume()
        } else {
            webSocket = nil
        }
    }
}

extension MessageWebSocketClient: URLSessionWebSocketDelegate {
    public func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
    }

    
    public func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
        self.webSocket = nil
    }
}

extension MessageWebSocketClient: MessageWebSocketClientProtocol {
    func subscribeToMessages(with completion: @escaping (String) -> Void) {
        webSocket?.receive(completionHandler: { result in
            switch result {
            case .failure:
                    break
                    // Ignore, do nothing for now
                case .success(let socketMessage):
                    switch socketMessage {
                    case .string(let stringMessage):
                        completion(stringMessage)
                        break
                    default:
                        break
                    }
                
                self.subscribeToMessages(with: completion)
                }
        })
    }
}
