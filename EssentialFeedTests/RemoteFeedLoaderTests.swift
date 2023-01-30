//
//  EssentialFeedTests.swift
//  EssentialFeedTests
//
//  Created by Walim Aloui on 30/01/2023.
//

import XCTest
@testable import EssentialFeed

class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.requestedURL = URL(string: "aURL.com")
    }
}

class HTTPClient {
    static let shared = HTTPClient()
    
    private init() {}
    var requestedURL: URL?
}

final class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient.shared
        _ = RemoteFeedLoader()
    
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDataFromURL() {
        let client = HTTPClient.shared
        let sut = RemoteFeedLoader()
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }
}
