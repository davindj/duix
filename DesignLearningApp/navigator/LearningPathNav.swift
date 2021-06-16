//
//  LearningPathNav.swift
//  DesignLearningApp
//
//  Created by Adimas Surya Perdana Putra on 15/06/21.
//

import SwiftUI

struct LearningPathNav: View {
    var body: some View {
        
        NavigationView{
            LearningPathList()
            
        }
        
    }
}

struct LearningPathNav_Previews: PreviewProvider {
    static var previews: some View {
        LearningPathNav()
    }
}
