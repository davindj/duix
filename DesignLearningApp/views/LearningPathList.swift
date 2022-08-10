//
//  LearningPathList.swift
//  DesignLearningApp
//
//  Created by David Tandjung on 08/06/21.
//

import SwiftUI

struct LearningPathList: View {
    @FetchRequest(entity: LearningPaths.entity(), sortDescriptors: []) var learningPaths: FetchedResults<LearningPaths>
    
    var body: some View {
        VStack(alignment:.center){
            VStack(spacing: 15){
                ForEach(learningPaths){path in
                    LearningPathItem(learningPath: path)
                }
            }
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
        return NavigationView{
            LearningPathList().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
