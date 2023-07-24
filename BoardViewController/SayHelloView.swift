//
//  SayHelloView.swift
//  BoardViewController
//
//  Created by 염성필 on 2023/07/24.
//

import SwiftUI
import Spiderversify

struct SayHelloView: View {
    @State private var glitching = false
    
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .ignoresSafeArea()
            .spiderversify($glitching, duration: 10, glitchInterval: 0.12)
            .onAppear {
                glitching = true
            }
    }
}
