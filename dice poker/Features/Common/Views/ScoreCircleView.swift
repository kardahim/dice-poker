//
//  ScoreCircleView.swift
//  dice poker
//

import SwiftUI

// MARK: Circle view
struct ScoreCircleView: View {
    
    @State private var waveOffset = Angle(degrees: 0)
    
    // 0 - 0/2 points
    // 50 - 1/2 points
    // 100 - 2/2 poin
    var percent: Int = 0
    
    // first player - blue
    // second player - red
    var isFirstPlayer = true
    let firstPlayer = Color(red: 52 / 255.0, green: 152 / 255.0, blue: 219 / 255.0)
    let secondPlayer = Color(red: 231 / 255.0, green: 76 / 255.0, blue: 60 / 255.0)
    
    var body: some View {

        GeometryReader { geo in
            ZStack {
                Circle()
                    .stroke(isFirstPlayer ? Color.blue : Color.red, lineWidth: 0.025 * min(geo.size.width, geo.size.height))
                    .overlay(
                        Wave(offset: Angle(degrees: self.waveOffset.degrees), percent: Double(percent)/100)
                            .fill(isFirstPlayer ? firstPlayer : secondPlayer)
                            .clipShape(Circle().scale(0.92))
                    )
            }
        }
        .aspectRatio(1, contentMode: .fit)
        .onAppear {
            DispatchQueue.main.async {
                withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                    self.waveOffset = Angle(degrees: 360)
                }
            }
        }
    }
}

struct ScoreCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreCircleView(percent: 50, isFirstPlayer: true)
    }
}
