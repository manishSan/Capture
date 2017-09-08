//
//  RealmProvider.swift
//  Capture
//
//  Created by Sanwal, Manish on 9/8/17.
//  Copyright © 2017 Toys R Us. All rights reserved.
//

import Foundation
import RealmSwift

/// Encapsulates realm creation logic
protocol RealmProviderProtocol {
    /// Returns realm instance
    ///
    /// - Returns: realm
    func realm() -> Realm
}

struct RealmProvider: RealmProviderProtocol {
    /// Returns realm instance
    ///
    /// - Returns: realm
    func realm() -> Realm {
        do {
            return try Realm()
        } catch {
            fatalError("Error creating realm")
        }
    }
}
