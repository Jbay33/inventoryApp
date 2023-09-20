//
//  ContentView.swift
//  inventoryApp
//
//  Created by  on 9/7/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var showingAlert = false
    @State private var colorChoice = "Red"
    @State private var sizeChoice = "M"
    @State var password = ""
    var shirtColor = ShirtColor(colorName: "Red", sizes: [0])
    var shirtArray = 0
    @State var colorList = inventoryList.colorListInv()
    var sizesArray = ["XXXL","XXL","XL","L","M","S"]
    


    
    var body: some View {
        
        NavigationStack {
            ZStack{
                GeometryReader { geometry in

                    SecureField("Password", text: $password)
                        .position(x:geometry.size.width/2+100, y:15)
                        .frame(width: 90)
                        
                    
                    NavigationLink {
                        if (password==""){
                            inventoryList()
                        }
                    } label: {
                        Text("Inventory")
                    }
                    .position(x:geometry.size.width/2, y:15)
                    
                  //text box
                    Picker("Color Selection", selection: $colorChoice) {
                        ForEach(colorList, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                    .position(x:geometry.size.width/3, y:(geometry.size.height/4))
                    .frame(width: 170)
                    
                    Picker("Size", selection: $sizeChoice) {
                        ForEach(sizesArray, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.menu)
                    .position(x:geometry.size.width*2/3, y:(geometry.size.height/4))
                    .frame(width: 100)
                    
                    
                    
                    
                    //confirmation alert
                    
                    Button("Submit"){
                        showingAlert = true
                    }.alert("Are you sure you want \(colorChoice): \(sizeChoice)", isPresented: $showingAlert) {
                        Button("Yes", role: .cancel) {
                            removeColor(color: colorChoice, size: sizeChoice)
                            
                        }
                        Button("No", role:.cancel){ }
                    }.position(x:geometry.size.width/2,y:geometry.size.height*2/4)
                    
                }
            }
        }
    }
     func removeColor(color:String, size: String){
        //removes inventory
        var colorIndex:Int = 0
        for i in 0..<colorList.count{
            if(ShirtColor.getColorName(shirt: inventoryList.arrayShirtColors[i])==color){
                colorIndex=i
            }
        }
        
        if (size=="XXXL"){
            inventoryList.arrayShirtColors[colorIndex].sizes[0] -= 1
        }
        if (size=="XXL"){
            inventoryList.arrayShirtColors[colorIndex].sizes[1] -= 1
        }

        if (size=="XL"){
            inventoryList.arrayShirtColors[colorIndex].sizes[2] -= 1
        }

        if (size=="L"){
            inventoryList.arrayShirtColors[colorIndex].sizes[3] -= 1
        }

        if (size=="M"){
            inventoryList.arrayShirtColors[colorIndex].sizes[4] -= 1
        }

        if (size=="S"){
            inventoryList.arrayShirtColors[colorIndex].sizes[5] -= 1
        }

    }
 
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
