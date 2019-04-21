//
//  MainViewCell.swift
//  FoodScanner
//
//  Created by Ali Jaber on 4/14/19.
//  Copyright © 2019 Ali Jaber. All rights reserved.
//

import UIKit

class MainViewCell: UICollectionViewCell {

    @IBOutlet weak var itemIcon: UIImageView!
    @IBOutlet weak var itemNameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func fillCell(with item:IconDetails)   {
        itemNameLabel.text  = item.name
        itemIcon.image = item.iconImage
    }

}
