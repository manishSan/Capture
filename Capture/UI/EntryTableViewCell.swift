//
//  EntryTableViewCell.swift
//  Capture
//
//  Created by Sanwal, Manish on 9/11/17.
//

import Foundation

class EntryTableViewCell: UITableViewCell {

    let entry = UILabel()

    let detail = UILabel()

    let stack = UIStackView()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
         super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)

        setUpCell()
        setConstraints()
    }

    func setUpCell() {
        entry.numberOfLines = 0
        entry.font = UIFont.systemFont(ofSize: 16, weight: UIFontWeightRegular)
        entry.layoutMargins = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)

        detail.numberOfLines = 0
        detail.font = UIFont.systemFont(ofSize: 12, weight: UIFontWeightThin)

        stack.axis = .vertical
        stack.spacing = 5
        stack.addArrangedSubview(entry)
        stack.addArrangedSubview(detail)
        self.contentView.addSubview(stack)
    }

    func setConstraints() {
        stack.translatesAutoresizingMaskIntoConstraints = false
        let attributes: [NSLayoutAttribute] = [.top, .bottom, .right, .left]
        NSLayoutConstraint.activate(attributes.map {
            let constant: CGFloat = ($0 == .left || $0 == .right) ? 5 : 0
            return NSLayoutConstraint(item: stack,
                                      attribute: $0,
                                      relatedBy: .equal,
                                      toItem: contentView,
                                      attribute: $0,
                                      multiplier: 1,
                                      constant: constant)
        })
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
