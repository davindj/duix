//
//  LearningPathItem.swift
//  DesignLearningApp
//
//  Created by David Tandjung on 08/06/21.
//

import SwiftUI

struct LearningPathItem: View {
    var path = ""
    var body: some View {
        
        NavigationLink(destination: CourseMenu(courseTitle: path)){
            
            ZStack{
                Image(path)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 344, height: 158)
                ZStack{
                    Rectangle().frame(maxWidth:.infinity)
                        .foregroundColor(Color("appSecondaryColor"))
                    VStack(alignment:.leading){
                        Text(path)
                            .font(.footnote)
                            .fontWeight(.bold)
                            
                        Text("Learn UI/UX Design")
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
        LearningPathItem(path: "Beginer")
    }
}
