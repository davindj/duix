//
//  CourseDetail.swift
//  DesignLearningApp
//
//  Created by Alamsyah Oktavian on 08/06/21.
//

import SwiftUI

struct CourseDetail: View {
    var body: some View {
        NavigationView {
            VStack(alignment:.leading) {
                Text("Typography Basics")
                    .font(.title)
                    .foregroundColor(Color("judul"))
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                    .padding(.bottom, 5.0)
                    
                Text("Design a custom table cell style for nonstandard table rows. Standard styles are great for use in a variety of common scenarios, but some content or your overall app design may call for a heavily customized table appearance. To learn how to create your own cells, see Customizing Cells in Table View Programming Guide for iOS.")
                    
                    
                    
                Spacer()
                
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
    }
}

struct CourseDetail_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetail()
    }
}
