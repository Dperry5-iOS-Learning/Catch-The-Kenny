//
//  AnimatedImageViewModel.swift
//  CatchTheKenny
//
//  Created by Dylan Perry on 3/18/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI
import Combine

final class AnimatedImageViewModel: ObservableObject {
    @Published var positionX: Int
    @Published var positionY: Int
    
    private var animationTimer: Timer {
     Timer.scheduledTimer(withTimeInterval: Constants.KENNY_ANIMATION_TIMER_INTERVAL, repeats: true) { _ in
            // Code here for the goodies
             let tupleArray = [
                 (Constants.x1,Constants.y1),
                 (Constants.x2,Constants.y2),
                 (Constants.x3,Constants.y3),
                 (Constants.x4,Constants.y4),
                 (Constants.x5,Constants.y5),
                 (Constants.x6,Constants.y6),
                 (Constants.x7,Constants.y7),
                 (Constants.x8,Constants.y8),
                 (Constants.x9,Constants.y9)
             ]
            
            var previousNumber: Int?
            
            func getRandomNumber() -> Int {
                var randomNumber = Int(arc4random_uniform(UInt32(tupleArray.count - 1)))
                
                while previousNumber == randomNumber {
                    randomNumber = Int(arc4random_uniform(UInt32(tupleArray.count - 1)))
                }
                
                previousNumber = randomNumber
                
                return randomNumber
            }
            
            self.positionX = tupleArray[getRandomNumber()].0
            print("X: \(self.positionX)")
            self.positionY = tupleArray[getRandomNumber()].1
            print("XY: \(self.positionY)")

        }
    }
    
    func stopGame(){
        animationTimer.invalidate()
    }
    
    func restartAnimation(){
        _ = animationTimer
    }
    
    init() {
        self.positionX = Constants.INITIAL_X
        self.positionY = Constants.INITIAL_Y
        _ = animationTimer
    }
}
