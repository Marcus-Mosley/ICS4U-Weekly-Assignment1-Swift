//
// ContentView.swift
// ICS4U-Weekly-Assignment1-Swift
//
// Created by Marcus A. Mosley on 2021-01-27
// Copyright (C) 2021 Marcus A. Mosley. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var str: String = ""
    @State private var max: Int = 0
    
    var body: some View {
        VStack {
            Text("The Max Run of \(str) is \(String(max))")
                .font(.body)
            TextField("Enter the String to find its Max Run", text: $str)
                .padding()
            Button("Click Me", action: {
                max = maxRun(str)
            })
            .padding()
        }
    }
    
    // Calculates the Max Run of the String
    func maxRun(_ str: String) -> Int {
        var index:String.Index = str.index(str.startIndex, offsetBy: 0)
        var runChar = str[index]
        var runCount: Int = 1
        var max: Int = 1
        
        for counter in 1...str.count - 1 {
            index = str.index(str.startIndex, offsetBy: counter)
            if (str[index] == runChar) {
                runCount += 1
                if (runCount > max) {
                    max = runCount
                }
            } else {
                runCount = 1
                runChar = str[index]
            }
        }
        return max
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
