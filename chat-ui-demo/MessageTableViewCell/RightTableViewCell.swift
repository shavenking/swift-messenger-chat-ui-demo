//
//  RightTableViewCell.swift
//  chat-ui-demo
//
//  Created by Andy Tsai on 13/03/2018.
//  Copyright © 2018 Andy Tsai. All rights reserved.
//

import UIKit

class RightTableViewCell: UITableViewCell {
    @IBOutlet weak var messageBackgroundView: UIView!
    @IBOutlet weak var messageLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        messageBackgroundView.layer.cornerRadius = 4
        messageBackgroundView.layer.masksToBounds = true
    }
}
