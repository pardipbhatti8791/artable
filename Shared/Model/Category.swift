//
//  Category.swift
//  Artable
//
//  Created by Pardip Bhatti on 11/06/19.
//  Copyright © 2019 Pardip Bhatti. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct Category {
    var name: String
    var id: String
    var imageUrl: String
    var isActive: Bool = true
    var timeStamp: Timestamp
}
