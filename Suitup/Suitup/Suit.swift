//
//  Suit.swift
//  Suitup
//
//  Created by Ziyao Wang on 3/24/17.
//  Copyright © 2017 Ziyao Wang. All rights reserved.
//

import Foundation
import UIKit

class Suit {
    
    var id : String = ""
    var out_top_id : String = ""
    var inn_top_id : String = ""
    var bot_id : String = ""
    var shoe_id : String = ""
    //var hat_id : String = ""
    var date_created : NSDate = NSDate()
    var description : String = ""
    var creator_id : String = ""
    var creator_name : String = ""
    
    var top:Item?
    var bot:Item?
    var shoe:Item?
    
    
    init(cloth:UIImage,pant:UIImage,shoes:UIImage){
        top=Item(img: cloth)
        bot=Item(img: pant)
        shoe=Item(img: shoes)
    }
    
    
}
