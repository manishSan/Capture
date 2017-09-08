//
//  DataStore.swift
//  Capture
//
//  Created by Sanwal, Manish on 9/8/17.
//  Copyright © 2017 Toys R Us. All rights reserved.
//

import Foundation
import RxSwift
import RxRealm

/// Protocol describes Data Store
protocol DataStoreProtocol {

    /// Save an entry
    ///
    /// - Parameters:
    ///   - entry: entry name
    ///   - details: a key value array of details
    /// - Throws: Exception if unable to insert to realm
    func save(entry: String, details: [(String, String)]?) throws

    /// get entries
    ///
    /// - Parameters:
    ///   - nameFilter: optional name filter
    ///   - sort: a sort on entry result
    ///   - ascending: is ascensing
    /// - Returns: Observable of array of `EntryProtocol`
    func get(nameFilter: String?, sort: Capture.EntrySort, ascending: Bool) -> Observable<[EntryProtocol]>
}

struct DataStore: DataStoreProtocol {

    let realmProvider: RealmProviderProtocol

    /// Save an entry
    ///
    /// - Parameters:
    ///   - entry: entry name
    ///   - details: a key value array of details
    /// - Throws: Exception if unable to insert to realm
    func save(entry: String, details: [(String, String)]?) throws {
        let en = Entry()
        en._name = entry
        en._timestamp = Date()
        if let dets = details {
            for d in dets {
                let reld = Detail()
                reld._key = d.0
                reld._value = d.1
                en._details.append(reld)
            }
        }

        let realm = self.realmProvider.realm()
        //realmProvider.realm().rx.add(en)
        try realm.write {
            realm.add(en)
        }
    }

    /// get entries
    ///
    /// - Parameters:
    ///   - nameFilter: optional name filter
    ///   - sort: a sort on entry result
    ///   - ascending: is ascensing
    /// - Returns: Observable of `EntryProtocol`
    func get(nameFilter: String?, sort: Capture.EntrySort, ascending: Bool) -> Observable<[EntryProtocol]> {
        var objects = realmProvider.realm().objects(Entry.self)
        if let filter = nameFilter {
            objects = objects.filter("_name contains '\(filter)'")
        }
        return Observable.collection(from: objects.sorted(byKeyPath: sort.keypath(),
                                                          ascending: ascending)).map({ $0.toArray() })
    }
}
