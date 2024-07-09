//
//  SubHeaderCollectionViewCell.swift
//  SampleSatck
//
//  Created by Timothy Obeisun on 7/9/24.
//

import UIKit

struct SubHeader {
    let title: String
}

class SubHeaderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    func setup(item: SubHeader) {
        titleLabel.text = item.title
    }
}
