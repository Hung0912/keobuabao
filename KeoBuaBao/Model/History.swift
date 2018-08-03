//
//  History.swift
//  KeoBuaBao
//
//  Created by LTT on 8/3/18.
//  Copyright © 2018 Hung. All rights reserved.
//

import Foundation
import RealmSwift

class History: Object {
    
    @objc dynamic var yourScore: Int = 0
    @objc dynamic var comScore: Int = 0
}

let realm = try! Realm()


