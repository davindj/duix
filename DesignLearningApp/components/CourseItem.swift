//
//  CourseItem.swift
//  DesignLearningApp
//
//  Created by Davin Djayadi on 17/06/21.
//

import SwiftUI

struct CourseItem: View {
    var course: Courses
    var body: some View{
        NavigationLink(destination: CourseDetail(course: course)){
            HStack{
                Image(course.thumbnail!)
                    .resizable()
                    .aspectRatio(contentMode: .fit )
                    .frame(width: 90, height: 100, alignment: .center)
                VStack (alignment: .leading, spacing: 10){
                    Text(course.title!)
                        .font(.callout)
                        .foregroundColor(Color("Subtitle"))
                    Text(course.desc!)
                        .font(.caption2)
                        .padding(.trailing,30)
                        .lineLimit(2)
                }
            }
        }
    }
}

struct CourseItem_Previews: PreviewProvider {
    static var previews: some View {
        let course = Courses(context: PersistenceController.preview.container.viewContext)
        course.thumbnail = "Asset_CP"
        course.title = "Color Palette"
        course.desc = "Design a custom table cell style for nonstandard table rows. Standard styles are great for use in a variety of common scenarios, but some content or your overall app design may call for a heavily customized table appearance. To learn how to create your own cells, see Customizing Cells in Table View Programming Guide for iOS."
        return NavigationView{
            List{
                CourseItem(course: course)
            }
        }
    }
}
