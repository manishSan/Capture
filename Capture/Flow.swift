//
//  Flow.swift
//  Capture
//
//  Created by Sanwal, Manish on 9/8/17.
//  Copyright © 2017 Toys R Us. All rights reserved.
//

import Foundation

protocol FlowProtocol {
    var dataStore: DataStoreProtocol { get }

    func captureUI() -> UINavigationController
}

struct Flow: FlowProtocol {



    let dataStore: DataStoreProtocol

    func captureUI() -> UINavigationController {
        let nav = UINavigationController()

        let vc = EntryTableView(viewModel: EntryTableViewModel(dataStore: dataStore,
                                                             tapClosure: { entry in
            nav.pushViewController(DetailsTableView(viewModel: DetailsTableViewModel(entry: entry)),
                                   animated: true)
        }))
        nav.viewControllers = [vc]
        return nav
    }
}
