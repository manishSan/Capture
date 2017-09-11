//
//  EntryTableView.swift
//  Capture
//
//  Created by Sanwal, Manish on 9/8/17.
//  Copyright © 2017 Toys R Us. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class EntryTableView: UIViewController {

    let tableView = UITableView()

    let disposeBag = DisposeBag()

    let viewModel: EntryTableViewModelProtocol

    init(viewModel: EntryTableViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        viewModel
            .entries
            .asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: "EntryCell",
                                         cellType:UITableViewCell.self)) { (_, element, cell) in
                cell.textLabel?.text = element.name
                cell.detailTextLabel?.text = element.timeStamp.description
        }.addDisposableTo(disposeBag)

        tableView
            .rx
            .modelSelected(EntryProtocol.self)
            .subscribe(onNext: { [weak self] entry in
                self?.viewModel.entryTapped(entry)

                if let selectedRowAtIndexPath = self?.tableView.indexPathForSelectedRow {
                    self?.tableView.deselectRow(at: selectedRowAtIndexPath, animated: true)
                }
            })
        .addDisposableTo(disposeBag)

        viewModel
            .entries
            .asObservable()
            .subscribe(onNext: { [unowned self] _ in
            self.tableView.reloadData()
            }, onError: { error in
                print(error)
        }, onCompleted: {
            print("Completed")
        })
        .addDisposableTo(disposeBag)

        viewModel.updateData()
    }

    func setConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let attributes: [NSLayoutAttribute] = [.top, .bottom, .right, .left]
        NSLayoutConstraint.activate(attributes.map {
            NSLayoutConstraint(item: tableView, attribute: $0, relatedBy: .equal, toItem: view.superview, attribute: $0, multiplier: 1, constant: 0)
        })
    }
}
