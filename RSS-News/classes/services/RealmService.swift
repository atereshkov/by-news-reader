//
//  RealmService.swift
//  RSS-News
//
//  Created by Alexander Tereshkov on 1/22/19.
//  Copyright © 2019 AT. All rights reserved.
//

import Foundation
import RealmSwift

protocol RealmServiceProtocol {
    func allNews() -> Results<RealmNewsItem>
    func allBookmarks() -> Results<RealmNewsItem>
    func newsItem(with url: String) -> RealmNewsItem?
    
    func isBookmarked(url: String) -> Bool
    
    func addBookmarks(_ items: [NewsItemProtocol])
    func removeBookmarks(_ items: [NewsItemProtocol])
}

class RealmService: RealmServiceProtocol {
    
    var realm: Realm {
        // swiftlint:disable force_try
        return try! Realm()
        // swiftlint:enable force_try
    }
    
    var isInWriteTransaction: Bool {
        return realm.isInWriteTransaction
    }
    
    func writeTransaction(_ block: @escaping ((Realm) -> Void)) {
        let realm = self.realm
        do {
            try realm.write {
                block(realm)
            }
        } catch let error {
            LoggerService.log.error("Failed to execute write transaction: \(error)")
        }
    }
    
}

extension RealmService {
    
    func allNews() -> Results<RealmNewsItem> {
        return realm.objects(RealmNewsItem.self)
    }
    
    func allBookmarks() -> Results<RealmNewsItem> {
        return realm.objects(RealmNewsItem.self).filter("isBookmarked = true")
    }
    
    func newsItem(with url: String) -> RealmNewsItem? {
        return realm.object(ofType: RealmNewsItem.self, forPrimaryKey: url)
    }
    
    func isBookmarked(url: String) -> Bool {
        guard let item = newsItem(with: url) else { return false }
        return item.isBookmarked
    }
    
    func addBookmarks(_ items: [NewsItemProtocol]) {
        let objects = items.map({ RealmNewsItem.from(item: $0, isBookmarked: true) })
        writeTransaction { realm in
            realm.add(objects, update: true)
        }
    }
    
    func removeBookmarks(_ items: [NewsItemProtocol]) {
        writeTransaction { realm in
            realm.delete(realm.objects(RealmNewsItem.self))
        }
    }
    
}
