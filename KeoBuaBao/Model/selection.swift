//
//  selection.swift
//  KeoBuaBao
//
//  Created by LTT on 7/31/18.
//  Copyright © 2018 Hung. All rights reserved.
//

import Foundation

class selection {
    private var _id: Int!
    private var _chon: String!
    
    var id: Int {
        return _id
    }
    
    var chon: String{
        return _chon
    }
    
    init(id: Int, chon: String){
        self._id = id
        self._chon = chon
    }
}
