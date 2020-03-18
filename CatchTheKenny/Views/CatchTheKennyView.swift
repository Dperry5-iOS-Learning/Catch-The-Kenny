//
//  CatchTheKennyView.swift
//  CatchTheKenny
//
//  Created by Dylan Perry on 3/18/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI

struct CatchTheKennyView: View {
    @State var score  = 0
    @State var timeLeft = Constants.GAME_TIME
    @State var chosenX = Constants.INITIAL_X
    @State var chosenY = Constants.INITIAL_Y
    @State var isGameOver: Bool = false
   // posiiton tutples
        
    @ObservedObject var timerViewModel = TimerViewModel()
        
       var body: some View {
           VStack{
               Spacer().frame(height: 100)
               
               Text("Catch The Kenny!")
                   .font(.largeTitle)
               HStack {
                Text("Time Left: \(timerViewModel.timeLeft)")
                       .font(.headline)
               }
               Text("Score: \(score)")
                   .font(.headline)
               
               Spacer()
            AnimatedImageView {
                self.score += 1
            }
               
               Spacer()

           }
           .alert(isPresented: self.$timerViewModel.isGameOver) { () -> Alert in
               return Alert(title: Text("Game Over!"), message: Text("Final Score: \(self.score)! Do you want to play again?"), primaryButton: Alert.Button.default(Text("Absolutely!"), action: {
                self.restartGame()
                    
                   
               }), secondaryButton: Alert.Button.cancel())
           }
       }
       
       
       func restartGame() {
            self.score = 0
            self.timerViewModel.restartGame()
        
       }
       
}

struct CatchTheKennyView_Previews: PreviewProvider {
    static var previews: some View {
        CatchTheKennyView()
    }
}
