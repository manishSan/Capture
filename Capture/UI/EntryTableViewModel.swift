//
//  EntryTableViewModel.swift
//  Capture
//
//  Created by Sanwal, Manish on 9/8/17.
//  Copyright © 2017 Toys R Us. All rights reserved.
//

import Foundation
import RxSwift

protocol EntryTableViewModelProtocol {
    var entries: Variable<[EntryProtocol]> { get }

    func updateData()

    func entryTapped(_ entry: EntryProtocol)
}

struct EntryTableViewModel: EntryTableViewModelProtocol {

    private let dataStore: DataStoreProtocol

    private let entryTapClosure: (EntryProtocol) -> Void

    private let disposeBag = DisposeBag()

    var entries: Variable<[EntryProtocol]>

    init(dataStore: DataStoreProtocol, tapClosure: @escaping (EntryProtocol) -> Void) {
        self.dataStore = dataStore
        entries = Variable([EntryProtocol]())
        entryTapClosure = tapClosure
    }

    func updateData() {
        dataStore.get(nameFilter: nil,
                      sort: .name,
                      ascending: false)
            .observeOn(MainScheduler.instance)
            .subscribe { (event) in
                switch event {
                case .next(let response):
                    self.entries.value = response
                case .error(let error):
                    print(error)
                case .completed:
                    print("Completed")
                }
        }.addDisposableTo(disposeBag)
    }

    func entryTapped(_ entry: EntryProtocol) {
        entryTapClosure(entry)
    }
}
