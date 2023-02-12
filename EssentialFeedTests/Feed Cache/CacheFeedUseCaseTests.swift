//
//  CacheFeedUseCaseTests.swift
//  EssentialFeedTests
//
//  Created by Walim Aloui on 12/02/2023.
//

import XCTest
import EssentialFeed

class LocalFeedLoader {
    
    private let store: FeedStore
    init(store: FeedStore) {
        self.store = store
    }
    
    func save(_: [FeedItem]) {
        store.deleteCachedFeed()
    }
}

class FeedStore {
    var deleteCachedFeedCallCout = 0
    
    func deleteCachedFeed() {
        deleteCachedFeedCallCout += 1
    }
}

class CacheFeedUseCaseTests: XCTestCase {
    
    func test_init_doesNotDeleteCacheUponCreation() {
        let store = FeedStore()
        _ = LocalFeedLoader(store: store)
        XCTAssertEqual(store.deleteCachedFeedCallCout, 0)
    }
    
    func test_save_requestsCacheDeletion() {
        let store = FeedStore()
        let sut = LocalFeedLoader(store: store)
        let items = [uniqueItem(), uniqueItem()]
        sut.save(items)
        XCTAssertEqual(store.deleteCachedFeedCallCout, 1)
    }
    
    // MARK: - Helpers
    
    private func uniqueItem() -> FeedItem {
        return FeedItem(
            id: UUID(),
            description: "any description",
            location: "any location",
            imageURL: anyURL()
        )
    }
    
    private func anyURL() -> URL {
        URL(string: "any-url.com")!
    }
}
