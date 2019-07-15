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
                ["4", "5", "6", "-"],
                ["1", "2", "3", "+"],
                ["0", ".", "="]]
    let dataTop = ["AC", "+/-","%"]
    let dataCalc = ["÷","×","-","+","="]
    let MAX_LENGTH = 9
    @State private var userIsInTheMiddleOfTyping = false
    @State private var display = "0"
    @State private var calc = Calculator()
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
                        .font(.custom("Roboto-Light",size: 75))
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
                                            .tapAction {
                                                if item == "AC"{
                                                    self.display = "0"
                                                    self.calc.accum = ""
                                                    self.userIsInTheMiddleOfTyping = false
                                                }else if item == "+/-"{
                                                    if self.display.prefix(1) == "-"{
                                                        self.display = String(self.display.suffix(self.display.count-1))
                                                        
                                                        print("-"+self.display)
                                                    }else{
                                                        self.display = "-" + self.display
                                                        
                                                        print("+"+self.display)
                                                    }
                                                }else if item == "%"{
                                                    self.display = String(Double(self.display)! * 0.01)

                                                }
                                        }
                                    }else if self.dataCalc.contains(item){
                                        Text(item)
                                            .color(Color.white)
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                            .frame(width: 90.0, height: 90.0)
                                            .background(Color.orange,cornerRadius: Length(100))
                                            .tapAction {
                                                self.performOperation(item)
                                        }
                                    }else if item == "0" {
                                        Text(item)
                                            .color(Color.white)
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                            .frame(width: 180.0, height: 90.0)
                                            .background(Color(red: 79/255, green: 79/255, blue: 79/255),cornerRadius: Length(100))
                                            .tapAction {
                                                if self.display != "0"{
                                                    self.tapDigit(item)
                                                }else{
                                                    self.display = "0"
                                                }
                                        }
                                    }else{
                                        Text(item)
                                            .color(Color.white)
                                            .font(.largeTitle)
                                            .fontWeight(.bold)
                                            .frame(width: 90.0, height: 90.0)
                                            .background(Color(red: 79/255, green: 79/255, blue: 79/255),cornerRadius: Length(100))
                                            .tapAction {
                                                self.tapDigit(item)
                                        }
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
    
    private func tapDigit(_ digit: String) {
        
        if display.count != MAX_LENGTH{
            if userIsInTheMiddleOfTyping {
                if  digit == "." {
                    if !display.contains("."){
                        display += digit
                        userIsInTheMiddleOfTyping = true
                    }
                } else {
                    display += digit
                    userIsInTheMiddleOfTyping = true
                }
            }else {
                display = digit
                userIsInTheMiddleOfTyping = true
            }
        }
    }
    
    private func performOperation(_ symbol: String) {
        print(#function)
        if userIsInTheMiddleOfTyping {
            calc.setOperand(display)
            userIsInTheMiddleOfTyping = false
        }
        
        calc.performOperation(symbol)
        
        if let result = calc.result {
            display = String(result)
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
