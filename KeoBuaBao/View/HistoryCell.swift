//
//  HistoryCell.swift
//  KeoBuaBao
//
//  Created by LTT on 8/3/18.
//  Copyright © 2018 Hung. All rights reserved.
//

import UIKit

class HistoryCell: UITableViewCell {
    @IBOutlet weak var yourScoreLabel: UILabel!
    @IBOutlet weak var comScoreLabel: UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.cornerRadius = 5.0
    }

    func configureCell (history: History) {
        yourScoreLabel.text = "\(history.yourScore)"
        comScoreLabel.text = "\(history.comScore)"
    }
}
