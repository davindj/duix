//
//  LearningPathItem.swift
//  DesignLearningApp
//
//  Created by David Tandjung on 08/06/21.
//

import SwiftUI

struct LearningPathItem: View {
    var learningPath: LearningPaths
    var body: some View {
        NavigationLink(destination: CourseMenu(learningPath: learningPath)){
            ZStack{
                Image(learningPath.image!)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 344, height: 158)
                ZStack{
                    Rectangle().frame(maxWidth:.infinity)
                        .foregroundColor(Color("appSecondaryColor"))
                    VStack(alignment:.leading){
                        Text(learningPath.difficulty!.name!)
                            .font(.footnote)
                            .fontWeight(.bold)
                        Text(learningPath.name!)
                            .font(.body)
                            .fontWeight(.bold)
                    }
                    .frame(maxWidth:.infinity, alignment:.leading)
                    .foregroundColor(.white)
                    .padding(.leading)
                }
                .padding(.top, 100)
            }.frame(width: 344, height: 158)
            .mask(RoundedRectangle(cornerRadius: 11))
        }
    }
}

struct LearningPathItem_Previews: PreviewProvider {
    static var previews: some View {
        let moc = PersistenceController.preview.container.viewContext
        let path1 = LearningPaths(context: moc)
        path1.name = "Learn UI/UX design from scratch"
        path1.image = "Beginner"
        path1.desc = "Design a custom table cell style for nonstandard table rows. Standard styles are great for use in a variety of common scenarios, but some content or your overall app design may call for a heavily customized table appearance. To learn how to create your own cells, see Customizing Cells in Table View Programming Guide for iOS."
        path1.difficulty = Difficulties(context: moc)
        path1.difficulty?.name = "Beginner"
        
        return NavigationView{
            List{
                LearningPathItem(learningPath: path1)
            }
        }
    }
}
