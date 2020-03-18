//
//  TimerViewModel.swift
//  CatchTheKenny
//
//  Created by Dylan Perry on 3/18/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI
import Combine

final class TimerViewModel: ObservableObject {
    @Published var isGameOver: Bool = false
    @Published var timeLeft: Double = Constants.GAME_TIME
    
    var counterTimer: Timer {
        Timer.scheduledTimer(withTimeInterval: Constants.TIMER_INCREMENT, repeats: true) { (_) in
               if self.timeLeft < 0.5 {
                       self.isGameOver = true
                   } else {
                       self.timeLeft -= 1;
                   }
               }
       }
 
    
    init(){
        _ = self.counterTimer
    }
    
    func restartGame(){
        self.timeLeft = Constants.GAME_TIME
        self.isGameOver = false
    }
    
}
