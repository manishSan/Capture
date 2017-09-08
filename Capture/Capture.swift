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

    private let store: DataStoreProtocol
    private let uiClosure: () -> UINavigationController

    public func saveEntry(name: String, details: [(String, String)]?) throws {
        try store.save(entry: name, details: details)
    }

    public func getEntries(nameFilter: String?,
                           sort: EntrySort = .name,
                           ascending: Bool = false) -> Observable<[EntryProtocol]> {
        return store.get(nameFilter: nameFilter, sort: sort, ascending: ascending)
    }

    public func getUI() -> UINavigationController {
        return uiClosure()
    }
}
