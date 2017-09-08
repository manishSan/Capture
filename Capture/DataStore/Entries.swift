//
//  Entry.swift
//  Capture
//
//  Created by Sanwal, Manish on 9/8/17.
//  Copyright © 2017 Toys R Us. All rights reserved.
//

import Foundation
import RealmSwift

/// Realm class to store Entries
// swiftlint:disable identifier_name
class Entry: Object {
    /// entry Name
    dynamic var _name = ""
    /// timestamp
    dynamic var _timestamp = Date()
    /// Assocaited Details key value pair
    let _details = List<Detail>()
}

/// Details - key value pair
class Detail: Object {
    dynamic var _key = ""
    dynamic var _value = ""
}
// swiftlint:enable identifier_name

extension Entry: EntryProtocol {
    /// Entry Name
    var name: String {
        return _name
    }
    /// Entry time stamp
    var timeStamp: Date {
        return _timestamp
    }
    /// Entry details
    var details: [DetailProtocol] {
        return _details.toArray()
    }
}

extension Detail: DetailProtocol {
    /// key
    var key: String {
        return _key
    }
    /// value
    var value: String {
        return _value
    }
}
