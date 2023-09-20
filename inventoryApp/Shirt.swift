//
//  Shirt.swift
//  inventoryApp
//
//  Created by  on 9/11/23.
//

import Foundation

struct Shirt: Identifiable{
    var id: String
    var color: String
    var size: String
    
    init(id: String, color: String, size: String) {
        self.id = id
        self.color = color
        self.size = size
    }
    
}
