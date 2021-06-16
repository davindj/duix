//
//  ProgressBarView.swift
//  DesignLearningApp
//
//  Created by David Tandjung on 09/06/21.
//

import SwiftUI

struct ProgressBarView: View {
    var scoreValue: Float
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 20.0)
                .opacity(0.3)
                .foregroundColor(.green)
            Circle()
                .trim(from: 0.0, to: CGFloat(scoreValue))
                .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap:.round))
                .foregroundColor(.green)
                .rotationEffect(.degrees(90))
            
        }
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView(scoreValue: 0.75)
    }
}
