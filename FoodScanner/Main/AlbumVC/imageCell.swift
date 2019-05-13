//
//  imageCell.swift
//  FoodScanner
//
//  Created by Ali Jaber on 4/20/19.
//  Copyright © 2019 Ali Jaber. All rights reserved.
//

import UIKit

class imageCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func fillCellWithImage(image:ImageObject)  {
//        if let imgData = image.image {
            imageView.image = image.image
        //}
    }

}
