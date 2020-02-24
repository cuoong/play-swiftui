//
//  ContentView.swift
//  RGBBullsEye
//
//  Created by Cuong Nguyen on 2/22/20.
//  Copyright © 2020 Cuong Nguyen. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let targetValue = Int.random(in: 0...100)
    @State var currentValue: Double = 50.0
    @State var showAlert = false
    
    func computeScore() -> Int {
        let diff = abs(targetValue - Int(currentValue))
        let point = 100 - diff
        return point
    }
    
    var body: some View {
        VStack {
            Text("Hello world")
            HStack {
                Text("0")
                Slider(value: $currentValue, in: 0...100, step: 1)
                Text("100")
            }
            Button(action: {self.showAlert = true }) {
                Text("Hit me!")
            }.alert(isPresented: $showAlert) { () -> Alert in
                Alert(title: Text("Your Score"), message: Text(String(computeScore())))
            }.padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView().previewLayout(.fixed(width: 568, height: 320))
  }
}
