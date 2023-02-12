//
//  CacheFeedUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Walim Aloui on 12/02/2023.
//

import XCTest

class LocalFeedLoader {
    init(store: FeedStore) {
        
    }
}

class FeedStore {
    
    var deleteCachedFeedCallCout = 0
}

class CacheFeedUseCaseTests: XCTestCase {
    
    func test_init_doesNotDeleteCacheUponCreation() {
        let store = FeedStore()
        let sut = LocalFeedLoader(store: store)
        XCTAssertEqual(store.deleteCachedFeedCallCout, 0)
    }
}
