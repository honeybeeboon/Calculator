//
//  ContentView.swift
//  Sample
//
//  Created by 下澤一輝 on 2019/07/14.
//  Copyright © 2019 下澤一輝. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    @State var num:Int = 1
    @State var showText = false
    let data = [["AC", "+/-", "%", "÷"],
                ["7", "8", "9", "×"],
                ["4", "5", "6", "ー"],
                ["1", "2", "3", "+"],
                ["0", ".", "="]]
    let dataTop = ["AC", "+/-","%"]
    let dataCalc = ["÷","×","ー","+","="]
    @State private var userIsInTheMiddleOfTyping = false
    @State private var display = "0"
    var body: some View {
        let margin: CGFloat = 10
        return ZStack(alignment: .center){
            Color.black
                .edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Spacer()
                    
                    Text(display)
                        .foregroundColor(Color.white)
                        .font(.custom("Roboto-Light",size: 80))
                        .frame(height: 50)
                    }
                    .padding(margin)
                VStack(alignment: .trailing, spacing: margin) {
                    ForEach(data.identified(by: \.description)) { items in
                        HStack(alignment: .center, spacing: margin) {
                            ForEach(items.identified(by: \.description)) { item in
                                Button(action: {}) {
                                    if self.dataTop.contains(item) {
                                        Text(item)
                                            .color(Color.black)
                                            .font(.largeTitle)
                                            .frame(width: 90.0, height: 90.0)
                                            .background(Color.gray,cornerRadius: Length(100))
                                    }else if self.dataCalc.contains(item){
                                        Text(item)
                                            .color(Color.white)
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                            .frame(width: 90.0, height: 90.0)
                                            .background(Color.orange,cornerRadius: Length(100))
                                    }else if item == "0" {
                                        Text(item)
                                            .color(Color.white)
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                            .frame(width: 180.0, height: 90.0)
                                            .background(Color(red: 79/255, green: 79/255, blue: 79/255),cornerRadius: Length(100))
                                        
                                    }else {
                                        Text(item)
                                            .color(Color.white)
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                            .frame(width: 90.0, height: 90.0)
                                            .background(Color(red: 79/255, green: 79/255, blue: 79/255),cornerRadius: Length(100))
                                    }
                                }
                            }
                            }
                            .padding(5)
                    }
                }
                
            }
        }
    }
}


#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
