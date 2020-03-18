//
//  AnimatedImageView.swift
//  CatchTheKenny
//
//  Created by Dylan Perry on 3/18/20.
//  Copyright © 2020 dperry.io. All rights reserved.
//

import SwiftUI
import Combine

struct AnimatedImageView: View {
    @ObservedObject var viewModel = AnimatedImageViewModel()
    
    let onTapGesture: () -> Void

    var body: some View {
        Image("kenny")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 100, height: 100)
        .position(x: CGFloat(viewModel.positionX), y: CGFloat(viewModel.positionY))
        .gesture(TapGesture(count: 1).onEnded({ (_) in
            self.onTapGesture()
        }))
    }
}
