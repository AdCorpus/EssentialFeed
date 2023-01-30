//
//  EssentialFeedTests.swift
//  EssentialFeedTests
//
//  Created by Walim Aloui on 30/01/2023.
//

import XCTest
@testable import EssentialFeed

class RemoteFeedLoader {
    
}

class HTTPClient {
    var requestedURL: URL?
}

final class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequestDataFromURL() {
        let client = HTTPClient()
        _ = RemoteFeedLoader()
    
        XCTAssertNil(client.requestedURL)
    }
}
