//
//  Item.swift
//  Suitup
//
//  Created by Ziyao Wang on 3/24/17.
//  Copyright © 2017 Ziyao Wang. All rights reserved.
//

import Foundation
import UIKit
class Item {
    
    var id : String = ""
    var name : String = ""
    var price : Double = 0.0
    var brand : String = ""
    var purchase_site : String = ""
    var type : String = ""
    
    var itemImage:UIImage?
    
    init(img:UIImage){
        itemImage = img
    }
    
}
