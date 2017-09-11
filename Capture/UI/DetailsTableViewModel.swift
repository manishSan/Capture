//
//  DetailsTableViewModel.swift
//  Capture
//
//  Created by Sanwal, Manish on 9/8/17.
//  Copyright © 2017 Toys R Us. All rights reserved.
//

import Foundation
import RxSwift

protocol DetailsTableViewModelProtocol {
    var details: Variable<[DetailProtocol]> { get }

    func shareStrings() -> [String]
}

struct DetailsTableViewModel: DetailsTableViewModelProtocol {

    private let entry: EntryProtocol

    let details = Variable([DetailProtocol]())

    init(entry: EntryProtocol) {
        self.entry = entry
        details.value = entry.details
    }

    func shareStrings() -> [String] {
        return details.value.map { $0.toString() }
    }
}

