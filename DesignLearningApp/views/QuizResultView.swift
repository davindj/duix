//
//  QuizResultView.swift
//  DesignLearningApp
//
//  Created by David Tandjung on 09/06/21.
//

import SwiftUI

struct QuizResultView: View {
    @Binding var isPresenting: Bool
    @Binding var scoreValue: Int
    
    var isGoodScore: Bool { scoreValue > 80 }
    
    var title: String{ isGoodScore ? "Great!" : "Not Bad!" }
    
    var message: String{
        isGoodScore ? "Practice makes perfect, keep up the good work!" :  "Design a custom table cell style for nonstandard table rows. Standard styles are great for use in a variety of common scenarios, but some content or your overall app design may call for a heavily customized table appearance. "
    }
    
    var body: some View {
        VStack{
            ZStack{
                ProgressBarView(scoreValue: Float(scoreValue) / Float(100))
                    .frame(width: 230, height: 230)
                Text("\(scoreValue)").font(.system(size:93))
            }.padding(.vertical, 45)
            
            Text(title)
                .font(.title2)
                .bold()
                .padding(.bottom)
            Text(message)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            Spacer()
            Button{
                isPresenting = false
            }label:{
                Text("Ok")
                    .bold()
                    .padding()
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(15)
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.all, 20)
    }
}

//struct QuizResultView_Previews_View: View {
//    @State var isPresenting: Bool = true
//    
//    var body: some View{
//        QuizResultView(isPresenting: $isPresenting)
//    }
//}

//struct QuizResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        QuizResultView_Previews_View()
//    }
//}
