//
//  ContentView.swift
//  Medit
//
//  Created by Stepan Potiienko on 28.08.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var timeLeft: Int16 = 30;
    
    func getMinutesLeft(timeLeft: Int16) -> Int16 {
        return timeLeft / 60
    }
    
    func countToZero(timeLeft: Int16) {
        if (timeLeft > 0) {
            return countToZero(timeLeft: timeLeft - 1)
        }
    }
    
    func getSecondsLeft(timeLeft: Int16) -> Int16 {
        return timeLeft % 60
    }
    
    var body: some View {
        VStack {
            Text("\(getMinutesLeft(timeLeft: timeLeft))m : \(getSecondsLeft(timeLeft: timeLeft))s").font(.system(size: 48, weight: .black))
        }
        .padding()
        .onAppear() {
            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) {
                timer in
                if timeLeft > 0 {
                    timeLeft -= 1
                } else {
                    timer.invalidate()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
