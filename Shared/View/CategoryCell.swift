//
//  CategoryCell.swift
//  Artable
//
//  Created by Pardip Bhatti on 11/06/19.
//  Copyright © 2019 Pardip Bhatti. All rights reserved.
//

import UIKit
import Kingfisher

class CategoryCell: UICollectionViewCell {

    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        categoryImage.layer.cornerRadius = 5
    }
    
    func configureCell(category: Category) {
        categoryName.text = category.name
        
        if let url = URL(string: category.imageUrl) {
            categoryImage.kf.setImage(with: url)
        }
    }

}
