//
//  LocalUser.swift
//  Suitup
//
//  Created by Ziyao Wang on 3/29/17.
//  Copyright © 2017 Ziyao Wang. All rights reserved.
//

import Foundation
import RealmSwift

class LocalUser: Object {
    
// Specify properties to ignore (Realm won't persist these)
    
//  override static func ignoredProperties() -> [String] {
//    return []
//  }
    dynamic var usremail=""
    dynamic var usrfirstname=""
    dynamic var usrlastname=""
    dynamic var usrpicurl=""
}
