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
                title()
                sanfran()
                newyork()
                linebawah()
                QuizView(quizzes: course.quizzes?.allObjects as! [Quizzes])
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
        }.navigationTitle(course.title!)
        .onAppear{
            print(course.quizzes?.allObjects as! [Quizzes])
        }
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



struct title: View {
    var body: some View {
        Text("Typography Basics")
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(Color("judul"))
            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
            .padding(.top, 25)
        Text("Apple provides two type families you can use in your iOS apps.")
            .font(.footnote)
            .fontWeight(.regular)
            .multilineTextAlignment(.leading)
            .padding(.top, 5)
    }
}

struct sanfran: View {
    var body: some View {
        Text("San Fransisco (SF)")
            .font(.footnote)
            .fontWeight(.bold)
            .multilineTextAlignment(.leading)
            .padding(.top, 2.0)
        Text("San Francisco is a sans serif type family that includes SF Pro, SF Pro Rounded, SF Mono, SF Compact, and SF Compact Rounded. SF Pro is the system font in iOS, macOS, and tvOS; SF Compact is the system font in watchOS. Designed to match the visual clarity of the platform UIs, the system fonts are legible and neutral.")
            .font(.footnote)
            .fontWeight(.regular)
            .multilineTextAlignment(.leading)
        
        Image("sf_font")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: /*@START_MENU_TOKEN@*/360.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
            .cornerRadius(10)
            .clipped()
    }
}


struct newyork: View {
    var body: some View {
        Text("New York (NY)")
            .font(.footnote)
            .fontWeight(.bold)
            .multilineTextAlignment(.leading)
            .padding(.top, 2.0)
        
        Text("New York is a serif typeface that provides a unique tone designed to complement the SF fonts. NY works as well in a graphic display context (at large sizes) as it does in a reading context (at text sizes).")
            .font(.footnote)
            .fontWeight(.regular)
            .multilineTextAlignment(.leading)
        
        Image("ny_font")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: /*@START_MENU_TOKEN@*/360.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100.0/*@END_MENU_TOKEN@*/)
            .cornerRadius(10)
            .clipped()
    }
}

struct linebawah: View {
    var body: some View {
        Text("Beginning in iOS 14, the system provides the San Francisco and New York fonts in the variable font format. This format combines different font styles together in one file, and supports interpolation between styles to create intermediate ones. With interpolation, typefaces can adapt to all sizes while appearing specifically designed for each size.")
            .font(.footnote)
            .fontWeight(.regular)
            .multilineTextAlignment(.leading)
        
        Text("Interpolation also enables optical sizing, which refers to the creation of different typographic designs to fit different sizes. In iOS 14 and later, the system fonts support dynamic optical sizes, merging a font's discrete optical sizes — such as Text and Display for SF Pro and SF Compact, and Small, Medium, Large, and Extra Large for New York — into a single, continuous design. This design allows each glyph or letterform to be interpolated to produce a structure that’s precisely adapted to the point size.")
            .font(.footnote)
            .fontWeight(.regular)
            .multilineTextAlignment(.leading)
            .padding(.top, 2.0)
    }
}

