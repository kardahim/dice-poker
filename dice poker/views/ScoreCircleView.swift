//
//  ScoreCircleView.swift
//  dice poker
//
//  Created by Kardahim on 27/12/2023.
//

import SwiftUI

// MARK: Wave structure
struct Wave: Shape {
    var offset: Angle
    var percent: Double
    
    var animatableData: Double {
        get { offset.degrees }
        set { offset = Angle(degrees: newValue) }
    }
    
    func path(in rect: CGRect) -> Path {
        var p = Path()
        
        let lowfudge = 0.02
        let highfudge = 0.98
        
        let newpercent = lowfudge + (highfudge - lowfudge) * percent
        let waveHeight = 0.015 * rect.height
        let yoffset = CGFloat(1 - newpercent) * (rect.height - 4 * waveHeight) + 2 * waveHeight
        let startAngle = offset
        let endAngle = offset + Angle(degrees: 360)
        
        p.move(to: CGPoint(x: 0, y: yoffset + waveHeight * CGFloat(sin(offset.radians))))
        
        for angle in stride(from: startAngle.degrees, through: endAngle.degrees, by: 5) {
            let x = CGFloat((angle - startAngle.degrees) / 360) * rect.width
            p.addLine(to: CGPoint(x: x, y: yoffset + waveHeight * CGFloat(sin(Angle(degrees: angle).radians))))
        }
        
        p.addLine(to: CGPoint(x: rect.width, y: rect.height))
        p.addLine(to: CGPoint(x: 0, y: rect.height))
        p.closeSubpath()
        
        return p
    }
}

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
            withAnimation(Animation.linear(duration: 2).repeatForever(autoreverses: false)) {
                self.waveOffset = Angle(degrees: 360)
            }
        }
    }
}

struct ScoreCircleView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreCircleView(percent: 50, isFirstPlayer: true)
    }
}
