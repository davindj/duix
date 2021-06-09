//
//  QuizResultView.swift
//  DesignLearningApp
//
//  Created by David Tandjung on 09/06/21.
//

import SwiftUI

struct QuizResultView: View {
    var scoreValue = 0.75
    var body: some View {
        NavigationView{
            VStack{
                ZStack{
                    ProgressBarView(scoreValue: Float(scoreValue))
                        .frame(width: 230, height: 230)
                    Text("75").font(.system(size:93))
                }.padding(.vertical, 45)
                
                Text("Not Bad!").font(.title2).bold().padding(.bottom, 22)
                Text("Design a custom table cell style for nonstandard table rows. Standard styles are great for use in a variety of common scenarios, but some content or your overall app design may call for a heavily customized table appearance. ")
                    .font(.body)
                    .frame(width: 304, height: 133, alignment: .center)
                    .multilineTextAlignment(.center)
                Spacer()
                
            }
                .navigationTitle("Results")
        }
        
    }
}

struct QuizResultView_Previews: PreviewProvider {
    static var previews: some View {
        QuizResultView()
    }
}
