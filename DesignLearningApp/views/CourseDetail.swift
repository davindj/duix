//
//  CourseDetail.swift
//  DesignLearningApp
//
//  Created by Alamsyah Oktavian on 08/06/21.
//

import SwiftUI

struct CourseDetail: View {
    var course: Courses
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                CourseDetailDescription(description: course.desc!)
                ForEach(course.getArrayCourseContents()){courseContent in
                    CourseDetailContent(courseContent: courseContent)
                }
                QuizView(quizzes: course.quizzes?.allObjects as! [Quizzes])
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
        }
        .navigationTitle(course.title!)
        .navigationBarTitleDisplayMode(.large)
    }
}

struct CourseDetailDescription: View {
    var description: String
    
    var body: some View {
        Text(description)
            .font(.footnote)
            .fontWeight(.regular)
            .multilineTextAlignment(.leading)
            .padding(.top, 5)
    }
}

struct CourseDetailContent: View{
    var courseContent: CourseContent
    
    var body: some View{
        if let title = courseContent.title {
            Text(title)
                .font(.footnote)
                .fontWeight(.bold)
                .multilineTextAlignment(.leading)
                .padding(.top, 2.0)
        }
        Text(courseContent.desc!)
            .font(.footnote)
            .fontWeight(.regular)
            .multilineTextAlignment(.leading)
        if let imageName = courseContent.imageName {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: /*@START_MENU_TOKEN@*/360.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
                .cornerRadius(10)
                .clipped()
        }
        Spacer()
            .frame(height: 20)
    }
}

struct CourseDetail_Previews: PreviewProvider {
    static var previews: some View {
        let course = Courses(context: PersistenceController.preview.container.viewContext)
        course.thumbnail = "Asset_CP"
        course.title = "Typhography"
        course.desc = "Design a custom table cell style for nonstandard table rows. Standard styles are great for use in a variety of common scenarios, but some content or your overall app design may call for a heavily customized table appearance. To learn how to create your own cells, see Customizing Cells in Table View Programming Guide for iOS."
        return NavigationView{
            CourseDetail(course: course)
        }
    }
}
