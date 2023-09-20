//
//  inventoryList.swift
//  inventoryApp
//
//  Created by  on 9/7/23.
//

import SwiftUI
import Combine

struct inventoryList: View {
    public static var arrayShirtColors:[ShirtColor] = [ShirtColor(colorName: "Red", sizes: [0,0,0,0,0,0])]
    var arraySizeMan = colorListInv().count
    @State private var milosHolyGrail = false
    
    var body: some View {
       
        ZStack{
            
            
            GeometryReader { geometry in
                
                //milosHolyButton
                Button(){
                   milosHolyGrail.toggle()
                } label: {
                    Image(systemName: "gobackward")}
                .position(x:geometry.size.width/2,y:15)
                
                //text labels
                Text("Add to Inventory")
                    .position(x:95,y:15)
                Text("Add New Color")
                    .position(x:geometry.size.width-90,y:15)
                
                
                //add shirt button
                NavigationLink(){
                    addInventoryView()
                } label: {
                    Image(systemName: "plus.app.fill")}
                .position(x:20,y:15)
                //add new color
                NavigationLink(){
                    addNewColorsView()
                } label: {
                    Image(systemName: "plus.app.fill")}
                .position(x:geometry.size.width-20,y:15)
                
                
                //display
                ScrollView {
                    LazyVStack(spacing: 10) {
                        ForEach(0..<inventoryList.arrayShirtColors.count) {i in
                            
                            ZStack {
                                
                                let name = inventoryList.colorListInv()
                                //background for display
                                Rectangle()
                                    .fill(Color("graya"))
                                    .frame(width: geometry.size.width, height: 200)
                                
                                //display info
                                var sizesNum = sizesAmount(colorOfShirt: inventoryList.arrayShirtColors[i])
                                Text(name[i])
                                    .foregroundColor(.black)
                                    .position(x:geometry.size.width/3,y:100)
                                Text("XXXL: \(sizesNum[0])")
                                    .position(x:geometry.size.width*2/3-50,y:50)
                                Text("XXL: \(sizesNum[1])")
                                    .position(x:geometry.size.width*2/3-50,y:100)
                                Text("XL: \(sizesNum[2])")
                                    .position(x:geometry.size.width*2/3-50,y:150)
                                
                                Text("L: \(sizesNum[3])")
                                    .position(x:geometry.size.width*2/3+50,y:50)
                                Text("M: \(sizesNum[4])")
                                    .position(x:geometry.size.width*2/3+50,y:100)
                                Text("S: \(sizesNum[5])")
                                    .position(x:geometry.size.width*2/3+50,y:150)
                                
                            }
                        }
                    }
                }
                .padding(.top, 15)
                .frame(width:geometry.size.width, height: geometry.size.height)
                .position(x:geometry.size.width/2, y:450)
                
            }
        }
    }
    
    
    
    
    
    //func for names of colors
    static func colorListInv()->Array<String>{
        var namesArray:[String] = []
        for i in 0..<inventoryList.arrayShirtColors.count{
            namesArray.append(ShirtColor.getColorName(shirt: inventoryList.arrayShirtColors[i]))
        }
        return namesArray
    }
    
    //func for sizes for each color
    func sizesAmount(colorOfShirt:ShirtColor)->Array<Int>{
        var shirtSizeAmount:[Int] = []
        for i in 0...5{
            shirtSizeAmount.append(colorOfShirt.sizes[i])
        }
        return shirtSizeAmount
    }
}


struct inventoryList_Previews: PreviewProvider {
    static var previews: some View {
        inventoryList()
    }
}


class kys: ObservableObject {
    internal let objectWillChange: ObservableObjectPublisher = ObservableObjectPublisher();
    
    func UPDATENOWNOWNOW() {
        objectWillChange.send()
    }
}
