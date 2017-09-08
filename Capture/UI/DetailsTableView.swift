//
//  DetailsTableView.swift
//  Capture
//
//  Created by Sanwal, Manish on 9/8/17.
//  Copyright © 2017 Toys R Us. All rights reserved.
//

import Foundation

import Foundation
import RxCocoa
import RxSwift

class DetailsTableView: UIViewController {

    let tableView = UITableView()

    let disposeBag = DisposeBag()

    let viewModel: DetailsTableViewModelProtocol

    init(viewModel: DetailsTableViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel
            .details
            .asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: "EntryCell",
                                         cellType:UITableViewCell.self)) { (_, detail, cell) in
                                            cell.textLabel?.text = detail.key
                                            cell.detailTextLabel?.text = detail.value
            }.addDisposableTo(disposeBag)

        tableView
            .rx
            .modelSelected(EntryProtocol.self)
            .subscribe(onNext: { [weak self] _ in
                if let selectedRowAtIndexPath = self?.tableView.indexPathForSelectedRow {
                    self?.tableView.deselectRow(at: selectedRowAtIndexPath, animated: true)
                }
            })
            .addDisposableTo(disposeBag)

        viewModel
            .details
            .asObservable()
            .subscribe(onNext: { [unowned self] _ in
                self.tableView.reloadData()
                }, onError: { error in
                    print(error)
            }, onCompleted: {
                print("Completed")
            })
            .addDisposableTo(disposeBag)
    }
}
