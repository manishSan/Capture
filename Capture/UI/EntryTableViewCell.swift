//
//  EntryTableViewCell.swift
//  Capture
//
//  Created by Sanwal, Manish on 9/11/17.
//

import Foundation

class EntryTableViewCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
         super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
