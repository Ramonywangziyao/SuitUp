//
//  SuitView.swift
//  Suitup
//
//  Created by Ziyao Wang on 3/25/17.
//  Copyright © 2017 Ziyao Wang. All rights reserved.
//

import Foundation
import UIKit

class SuitView : UIView {
    
    var top_innView : UIButton!
    var top_outView : UIButton?
    var bot_view : UIButton!
    var foot_view : UIButton!
    var suit_name : UILabel!
    var screen_width : CGFloat?
    

    override init(frame : CGRect){
        super.init(frame : frame)
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func updateConstraints() {
        // autolayout constraints
        super.updateConstraints()

    }

    
}
