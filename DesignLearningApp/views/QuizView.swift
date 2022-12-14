//
//  QuizView.swift
//  DesignLearningApp
//
//  Created by Davin Djayadi on 09/06/21.
//

import SwiftUI

struct Question: Identifiable{
    let id = UUID()
    var question: Quizzes
    var answer: Int = -1 // Jawaban User
}

struct QuizView: View {
    var quizzes: [Quizzes]
    
    @State private var showingSheet = false
    @State private var showingResultSheet = false
    @State private var result: Int = 0
    
    @FetchRequest(entity: LearningPaths.entity(), sortDescriptors: []) var learningPaths: FetchedResults<LearningPaths>
    
    func quizSubmit(score: Int){
        showingSheet = false
        showingResultSheet = true
        result = score
    }
    
    var body: some View {
        VStack{
            Button{
                showingSheet = true
            }label:{
                Text("Take Assesment Quiz")
                    .font(.body)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                    .frame(width: /*@START_MENU_TOKEN@*/360.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
                    .background(Color("warna_button"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $showingSheet) {
                QuizModalView(quizzes: quizzes, onQuizSubmit: quizSubmit)
            }
            .sheet(isPresented: $showingResultSheet){
                QuizResultView(isPresenting: $showingResultSheet, scoreValue: $result)
            }
        }
    }
}

struct QuizModalView: View {
    var onQuizSubmit: (Int)->Void
    
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
                    QuestionView(question: question,
                                 changeAnswer: self.changeAnswer(question: question))
                    Divider()
                }
                // Button Submit
                Button {
                    // Check apakah sudah jawab semua atau belum
                    let isDoneAnswering = !questions.contains(where: { $0.answer == -1 })
                    if isDoneAnswering {
                        var score: Int = 0
                        for question in questions{
                            print(question.answer, question.question.answer)
                            if question.answer == question.question.answer{
                                score += 100
                            }
                        }
                        score /= questions.count
                        self.onQuizSubmit(score)
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
    }
    
    // Constructor?
    init(quizzes: [Quizzes], onQuizSubmit: @escaping (Int)->Void){
        var listQuestion: [Question] = []
        for quiz in quizzes{
            listQuestion.append(Question(question: quiz, answer: -1))
        }
        self.questions = listQuestion
        self.onQuizSubmit = onQuizSubmit
    }
}

// MARK: Question View (Component)
struct QuestionView: View{
    // Dari Parent
    var question: Question
    var changeAnswer: (Int) -> Void
    // Return
    var body: some View{
        Group{
            // Pertanyaan
            HStack{
                Text(question.question.question!)
                    .bold()
                    .font(.title)
                    .foregroundColor(Color.init(hex: "105476"))
                    .lineLimit(3)
                Spacer()
            }.padding(.bottom)
            // Jawaban
            VStack(spacing: 10){
                HStack{
                    AnswerView(isChoosen: question.answer == 0, image: question.question.option1!){ changeAnswer(0) }
                    AnswerView(isChoosen: question.answer == 1, image: question.question.option2!){ changeAnswer(1) }
                }
                HStack{
                    AnswerView(isChoosen: question.answer == 2, image: question.question.option3!){ changeAnswer(2) }
                    AnswerView(isChoosen: question.answer == 3, image: question.question.option4!){ changeAnswer(3) }
                }
            }
        }
    }
}

// MARK: Answer View (Component)
struct AnswerView: View {
    var isChoosen: Bool
    var image: String
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
            Image(image)
                .resizable()
                .scaledToFit()
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
        QuizView(quizzes: [])
    }
}
