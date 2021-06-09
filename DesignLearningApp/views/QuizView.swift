//
//  QuizView.swift
//  DesignLearningApp
//
//  Created by Davin Djayadi on 09/06/21.
//

import SwiftUI

struct QuizView: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            QuizModalView(isPresented: $showingSheet)
        }
    }
}

struct QuizModalView: View {
    @Binding var isPresented: Bool

    var body: some View {
        VStack{
            TempView()
        }
    }
}

struct TempView: View {
    @State var qIdx: Int = 1 // Pertanyaan k Brp
    @State var aIdx: Int = 1 // Jaaban k Brp
    @State var answers: [Int] = []
    @State var questions: [Int] = []
    
    // Constant
    let colorNorm = Color.init(hex: "999999")
    let colorLast = Color.init(hex: "3299CE")
    
    // Computed Property
    var isLastQuestion: Bool{
        return qIdx == questions.count-1
    }
    var btnBgColor: Color{
        return isLastQuestion ? colorLast : colorNorm
    }
    // Function
    func changeAnswer(_ idx: Int){
        print("Hello \(idx)")
//        answers[qIdx] = idx
        aIdx = idx
        print(answers)
    }
    
    // View
    var body: some View {
        VStack{
            // Pertanyaan
            HStack{
                Text("Mana yang merupakan kombinasi typography terbaik?")
                    .bold()
                    .font(.title)
                    .foregroundColor(Color.init(hex: "105476"))
                    .lineLimit(3)
                Spacer()
            }
            // Spacer
            Spacer()
            // Jawaban
            VStack(spacing: 10){
                HStack{
                    AnswerView(isChoosen: aIdx == 0, content: "Nomor 1"){ changeAnswer(0) }
                    AnswerView(isChoosen: aIdx == 1, content: "Nomor 2"){ changeAnswer(1) }
                }
                HStack{
                    AnswerView(isChoosen: aIdx == 2, content: "Nomor 3"){ changeAnswer(2) }
                    AnswerView(isChoosen: aIdx == 3, content: "Nomor 4"){ changeAnswer(3) }
                }
            }
            .padding(.bottom, 10)
            
            // Spacer
            Spacer()
            // Button Prev Next
            HStack{
                Button("Previous"){
                    
                }.disabled(true)
                Spacer()
                Button("Next"){
                    
                }.disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            }.padding(.horizontal)
            .padding(.bottom, 10)
            // Button Submit
            Button {
                print("Image tapped!")
            } label: {
                Text("Submit")
                    .bold()
                    .padding()
                    .foregroundColor(.white)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(self.btnBgColor)
                    .cornerRadius(15)
            }
            .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
        }
        .padding(.horizontal, 30)
        .padding(.top, 40)
        .onAppear(perform: self.onAppear)
    }
    
    // Constructor?
    func onAppear(){
        questions += [1,2,3,4,5]
        for _ in questions{
            answers.append(-1)
        }
        qIdx = 0
        aIdx = -1
    }
}

// MARK: Answer View
struct AnswerView: View {
    var isChoosen: Bool
    var content: String
    var onAnswerClick: ()->Void
    // Computed Property
    var borderColor: Color{
        return isChoosen ? Color.init(hex: "3299CE") : Color.init(hex: "A4B9C3")
    }
    var borderWidth: CGFloat{
        return isChoosen ? 3 : 1
    }
    var body: some View {
        Button(){
            self.onAnswerClick()
        }label:{
            VStack {
                Text(content).font(.body)
            }
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 160)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(self.borderColor, lineWidth: self.borderWidth)
            )
        }
    }
}



struct QuizView_Previews: PreviewProvider {
    static var previews: some View {
        QuizView()
        TempView()
    }
}
