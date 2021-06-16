//
//  QuizView.swift
//  DesignLearningApp
//
//  Created by Davin Djayadi on 09/06/21.
//

import SwiftUI

struct Question: Identifiable{
    let id = UUID()
    var question: String
    var options: [Image]
    var answer: Int = -1 // Jawaban User
}

struct QuizView: View {
    @State private var showingSheet = false
    @State private var showingResultSheet = false
    @State private var result: Float = 0
    
    @FetchRequest(entity: LearningPaths.entity(), sortDescriptors: []) var learningPaths: FetchedResults<LearningPaths>
    
    func quizSubmit(score: Float){
        result = score
        showingResultSheet = true
        showingSheet = false
    }
    
    var body: some View {
        VStack{
            Button("CLick Me"){
                print(learningPaths)
                if learningPaths.count > 0{
                    print(learningPaths[0].name)
                    print(learningPaths[0].difficulty?.name)
                    print(learningPaths[0].courses)
                }
            }
            Button("Show Sheet") {
                showingSheet = true
            }
            .sheet(isPresented: $showingSheet) {
                QuizModalView(onQuizSubmit: quizSubmit)
            }
            .sheet(isPresented: $showingResultSheet){
                QuizResultView(isPresenting: $showingResultSheet, scoreValue: result)
            }
        }
    }
}

struct QuizModalView: View {
    var onQuizSubmit: (Float)->Void
    
    @State var questions: [Question] = []
    @State var showingAlert: Bool = false
    
    // Constant
    let colorNorm = Color.init(hex: "999999")
    let colorLast = Color.init(hex: "3299CE")
    
    // Computed Property
    var isLastQuestion: Bool{
        return true
    }
    var btnBgColor: Color{
        return isLastQuestion ? colorLast : colorNorm
    }
    // Function
    func changeAnswer(question: Question)->((Int)->Void){
        let idx = questions.firstIndex(where: { $0.question == question.question }) ?? -1
        return { aIdx in
            if idx >= 0{
                self.questions[idx].answer = aIdx
            }
        }
    }
    
    // View
    var body: some View {
        ScrollView{
            VStack{
                ForEach(questions) { question in
                    QuestionView(aIdx: question.answer, changeAnswer: self.changeAnswer(question: question))
                    Divider()
                }
                // Button Submit
                Button {
                    // Check apakah sudah jawab semua atau belum
                    let isDoneAnswering = !questions.contains(where: { $0.answer == -1 })
                    if isDoneAnswering {
                        var score: Float = 0
                        for question in questions{
                            if question.answer == 0{
                                score += 1
                            }
                        }
                        score = score / Float(questions.count)
                        self.onQuizSubmit(score)
                        print("Well Done")
                    }else{
                        showingAlert.toggle()
                    }
                } label: {
                    Text("Submit")
                        .bold()
                        .padding()
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(self.btnBgColor)
                        .cornerRadius(15)
                }
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("Unable to Submit"),
                        message: Text("Please answer all question first"),
                        dismissButton: .default(
                            Text("Got it.")
                        )
                    )
                }
            }
            .padding(.horizontal, 30)
            .padding(.top, 40)
        }
        .onAppear{ initQuiz() }
    }
    
    // Constructor?
    func initQuiz(){
        let listQuestion: [Question] = [
            Question(question: "Mana yang merupakan kombinasi typography terbaik?", options: []),
            Question(question: "Mana yang merupakan kombinasi terbaik?", options: []),
            Question(question: "Mana yang merupakan typography terbaik?", options: []),
            Question(question: "Mana yang merupakan kombinasi typography?", options: []),
            Question(question: "Mana kombinasi typography terbaik?", options: [])
        ]
        self.questions = listQuestion
        print("Struct updated")
    }
}

// MARK: Question View (Component)
struct QuestionView: View{
    // Dari Parent
    var aIdx: Int
    var changeAnswer: (Int) -> Void
    // Return
    var body: some View{
        Group{
            // Pertanyaan
            HStack{
                Text("Mana yang merupakan kombinasi typography terbaik?")
                    .bold()
                    .font(.title)
                    .foregroundColor(Color.init(hex: "105476"))
                    .lineLimit(3)
                Spacer()
            }.padding(.bottom)
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
        }
    }
}

// MARK: Answer View (Component)
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
//        QuizModalView()
    }
}
