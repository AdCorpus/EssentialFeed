//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Walim Aloui on 30/01/2023.
//

import Foundation

public enum LoadFeedResult {
    case success([FeedItem])
    case failure(Error)
}
 
public protocol FeedLoader {
    func load(completion: @escaping (LoadFeedResult) -> Void)
}
