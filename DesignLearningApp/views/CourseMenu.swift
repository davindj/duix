//
//  ContentView.swift
//  Belajar
//
//  Created by Adimas Surya Perdana Putra on 11/06/21.
//

import SwiftUI

struct CourseMenu: View {
    var learningPath: LearningPaths
    
    var body: some View {
        ZStack{
            Background()
            ScrollView{
                VStack(spacing:5){
                    LevelCourseTitle(difficulty: learningPath.difficulty!.name!)
                    LearningCourseTitle(title: learningPath.name!)
                    BodyExplain(desc: learningPath.desc!)
                    LessonsTitle()
                    ForEach(learningPath.courses?.allObjects as! [Courses]){course in
                        CourseItem(course: course)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 200)
            }
        }.navigationBarTitle("Course Menu", displayMode: .automatic)
    }
}

struct CourseMenu_Previews: PreviewProvider {
    static var previews: some View {
        let moc = PersistenceController.preview.container.viewContext
        let path1 = LearningPaths(context: moc)
        path1.name = "Learn UI/UX design from scratch"
        path1.image = "Beginner"
        path1.desc = "Design a custom table cell style for nonstandard table rows. Standard styles are great for use in a variety of common scenarios, but some content or your overall app design may call for a heavily customized table appearance. To learn how to create your own cells, see Customizing Cells in Table View Programming Guide for iOS."
        path1.difficulty = Difficulties(context: moc)
        path1.difficulty?.name = "Beginner"
        
        let course1 = Courses(context: moc)
        course1.thumbnail = "Asset_CP"
        course1.title = "Color Palette"
        course1.desc = "Design a custom table cell style for nonstandard table rows. Standard styles are great for use in a variety of common scenarios, but some content or your overall app design may call for a heavily customized table appearance. To learn how to create your own cells, see Customizing Cells in Table View Programming Guide for iOS."
        course1.score = 0
        course1.isDone = false
        
        let course2 = Courses(context: moc)
        course2.thumbnail = "Asset_Tyh"
        course2.title = "Typography"
        course2.desc = "Design a custom table cell style for nonstandard table rows. Standard styles are great for use in a variety of common scenarios, but some content or your overall app design may call for a heavily customized table appearance. To learn how to create your own cells, see Customizing Cells in Table View Programming Guide for iOS."
        course2.score = 0
        course2.isDone = false
        
        path1.addToCourses(course1)
        path1.addToCourses(course2)
        
        return NavigationView{
            CourseMenu(learningPath: path1)
        }
    }
}

struct Background: View{
    var body: some View{
        Image("top_bg")
            .resizable()
            .frame(width: 400, height: 265, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding(.bottom, 520)
        }
    }


struct LevelCourseTitle: View{
    var difficulty: String
    var body: some View{
        HStack{
            Text(difficulty)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("titleColor"))
                .multilineTextAlignment(.leading)
            Spacer()
        }
    }
}


struct LearningCourseTitle: View{
    var title: String
    var body: some View{
        HStack{
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.trailing,90.0)
                .foregroundColor(Color("Subtitle"))
            Spacer()
        }
    }
}


struct BodyExplain: View{
    var desc: String
    var body: some View{
        Text(desc)
            .font(.footnote)
            .padding(.vertical)
            .multilineTextAlignment(.leading)
    }
}

struct LessonsTitle: View{
    var body: some View{
        HStack{
            Text("Lessons")
                .fontWeight(.bold)
                .font(.title2)
                .foregroundColor(Color("Subtitle"))
            Spacer()
        }
    }
}
