//
//  LearningPathList.swift
//  DesignLearningApp
//
//  Created by David Tandjung on 08/06/21.
//

import SwiftUI

struct LearningPathList: View {
    var paths = ["Beginner", "Intermediate", "Expert"]
    var body: some View {
       
            VStack(alignment:.center){
                ForEach(paths.sorted(), id: \.self){path in
                    LearningPathItem(path: path).padding(.bottom, 15)
                }
                Spacer().frame(height:32)
                Button(action: {}, label: {
                    Text("Add New Goals").bold()
                })
                .frame(maxWidth:343)
                .padding(.vertical)
                .background(Color("appPrimaryColor"))
                .foregroundColor(.white)
                .mask(RoundedRectangle(cornerRadius: 11))
                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading , 18)
            .padding(.top)
            .navigationTitle("Learning Path")
            .navigationBarTitleDisplayMode(.inline)
            .foregroundColor(Color("appSecondaryColor"))
        }
    }

struct LearningPathList_Previews: PreviewProvider {
    static var previews: some View {
        LearningPathList()
    }
}