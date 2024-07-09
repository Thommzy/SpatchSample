//
//  DataCollectionViewCell.swift
//  SampleSatck
//
//  Created by Timothy Obeisun on 7/9/24.
//

import UIKit

struct DataPayload {
    let date: String
    let orderID: String
    let amount: String
    let distance: String
}

class DataCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    func setup(item: DataPayload) {
        dateLabel.text = item.date
        amountLabel.text = item.amount
    }
}
