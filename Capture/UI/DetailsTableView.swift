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
        view.addSubview(tableView)
        setConstraints()

        self.title = "Details"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose,
                                                                 target: self, action: #selector(share))

        tableView.register(EntryTableViewCell.self, forCellReuseIdentifier: "DetailCell")
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 80

        viewModel
            .details
            .asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: "DetailCell",
                                         cellType:EntryTableViewCell.self)) { (_, detail, cell) in
                                            cell.entry.text = detail.key
                                            cell.detail.text = detail.value
            }.addDisposableTo(disposeBag)

        tableView
            .rx
            .modelSelected(DetailProtocol.self)
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

    func setConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let attributes: [NSLayoutAttribute] = [.top, .bottom, .right, .left]
        NSLayoutConstraint.activate(attributes.map {
            NSLayoutConstraint(item: tableView,
                               attribute: $0,
                               relatedBy: .equal,
                               toItem: view,
                               attribute: $0,
                               multiplier: 1,
                               constant: 0)
        })
    }

    @objc func share() {
        let activityViewController = UIActivityViewController(activityItems: viewModel.shareStrings(),
                                                              applicationActivities: nil)
        present(activityViewController, animated: true, completion: {})
    }
}
