//
//  Capture.swift
//  Capture
//
//  Created by Sanwal, Manish on 9/8/17.
//  Copyright © 2017 Toys R Us. All rights reserved.
//

import Foundation
import RxSwift

/// Protocol describes an Entry
public protocol EntryProtocol {
    /// Entry Name
    var name: String { get }
    /// Entry time stamp
    var timeStamp: Date { get }
    /// Entry details
    var details: [DetailProtocol] { get }
}

/// Protocol describes an entry detail
public protocol DetailProtocol {
    /// key
    var key: String { get }
    /// value
    var value: String { get }
}

public struct Capture {
    /// Emum for sort parametes for Entries
    ///
    /// - name: sort on name
    /// - timestamp: sort on timestamp
    public enum EntrySort {
        case name
        case timestamp

        func keypath() -> String {
            switch self {
            case .name:
                return "_name"
            default:
                return "_timestamp"
            }
        }
    }

    /// private data store
    private let store: DataStoreProtocol

    /// private realm provider
    private let realmProvider: RealmProviderProtocol

    /// private flow coordinator
    private let flow: Flow

    /// initializer for Capture
    public init() {
        realmProvider = RealmProvider()
        store = DataStore(realmProvider: realmProvider)
        flow = Flow(dataStore: store)
    }


    /// Save an entry to Capture
    ///
    /// - Parameters:
    ///   - name: name of entry
    ///   - details: an optional array of keyvalue pairs as description

    public func saveEntry(name: String, details: [(String, String)]?) {
        do { try store.save(entry: name, details: details) }
        catch { fatalError("Unable to write to local realm") }
    }

    /// get all entries from capture
    ///
    /// - Parameters:
    ///   - nameFilter: a filter on name
    ///   - sort: sort options, default set to sort on name
    ///   - ascending: Bool parameter to indicate sort order, default set to descending
    /// - Returns: <#return value description#>
    public func getEntries(nameFilter: String?,
                           sort: EntrySort = .name,
                           ascending: Bool = false) -> Observable<[EntryProtocol]> {
        return store.get(nameFilter: nameFilter, sort: sort, ascending: ascending)
    }

    /// Get tabular UI from capture
    ///
    /// - Returns: returns a navigation controller
    public func getUI() -> UINavigationController {
        return flow.captureUI()
    }
}
