//
//  ContentView.swift
//  DesignLearningApp
//
//  Created by David Tandjung on 04/06/21.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    @State private var showingSheet = false
    
    var body: some View {
        QuizView()
        .onAppear{
            // Generate Data
            // Difficulty
            var diffEasy = Difficulties(context: self.moc)
            diffEasy.name = "Easy"
//            var diffMed = Difficulties(context: self.moc)
//            diffMed.name = "Medium"
//            var diffHard = Difficulties(context: self.moc)
//            diffHard.name = "Hard"
            // Learning Path
            var path1 = LearningPaths(context: self.moc)
            path1.name = "Path 1"
            path1.image = "Path Image"
            path1.desc = "Path Description"
            path1.difficulty = diffEasy
            
            // Courses
            var course1 = Courses(context: self.moc)
            course1.thumbnail = "Thumbnail"
            course1.title = "Title"
            course1.desc = "Desc"
            course1.image = "image"
            
            // Quiz
            var quiz1 = Quizzes(context: self.moc)
            quiz1.question = "Question 1..."
            quiz1.option1 = "Option 1..."
            quiz1.option2 = "Option 2..."
            quiz1.option3 = "Option 3..."
            quiz1.option4 = "Option 4..."
            quiz1.answer = 1 // Index dlm zero based
            
            var quiz2 = Quizzes(context: self.moc)
            quiz2.question = "Question 2..."
            quiz2.option1 = "Option 1..."
            quiz2.option2 = "Option 2..."
            quiz2.option3 = "Option 3..."
            quiz2.option4 = "Option 4..."
            quiz2.answer = 1 // Index dlm zero based
            
            course1.addToQuizzes(quiz1)
            course1.addToQuizzes(quiz2)
            
            try! moc.save()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
