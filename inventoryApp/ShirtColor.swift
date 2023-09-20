//
//  ShirtColor.swift
//  inventoryApp
//
//  Created by  on 9/11/23.
//

import Foundation
//
//  Color.swift
//  inventoryApp
//
//  Created by  on 9/11/23.
//

import Foundation

class ShirtColor:ObservableObject {
    
     @Published var colorName: String
     @Published var sizes: Array<Int>
     static var listColor: Array<String> = []
    
    init(colorName: String, sizes: Array<Int>) {
        self.colorName = colorName
        self.sizes = sizes
        ShirtColor.listColor.append(colorName)
    }
    
    
    
     func addToColor(newShirts: Array<Int>){
        //adding inventory
        for i in 0..<6{
            sizes[i]+=newShirts[i]
        }
    }
    
    
    static func getColorName(shirt:ShirtColor)->String{
        return shirt.colorName
    }
    
}
