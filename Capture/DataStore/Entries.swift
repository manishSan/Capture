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
class Entry: Object {
    /// entry Name
    dynamic var name = ""
    /// timestamp
    dynamic var timestamp = Date()
    /// Assocaited Details key value pair
    let details = List<Detail>()
}

/// Details - key value pair
class Detail: Object {
    dynamic var key = ""
    dynamic var value = ""
}
