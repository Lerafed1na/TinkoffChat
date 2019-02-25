//
//  ChatTableViewCell.swift
//  TinkoffChat
//
//  Created by Valeriia Korenevich on 24/02/2019.
//  Copyright © 2019 Valeriia Korenevich. All rights reserved.
//

import UIKit

protocol MessageCellConfiguration: class{
    var textMessage: String? {get set}
}

class ChatTableViewCell:  UITableViewCell, MessageCellConfiguration {
    
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var messageView: UIView!
    
    var textMessage: String? {
        didSet {
            messageLabel.text = textMessage
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        messageView.layer.cornerRadius = 15
        messageView.clipsToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
