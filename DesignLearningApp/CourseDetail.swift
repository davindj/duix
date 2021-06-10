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
            ScrollView {
                VStack(alignment: .leading) {
                    Text("Typography Basics")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(Color("judul"))
                        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                        .padding(.bottom, 5.0)
                        
                    Text("Design a custom table cell style for nonstandard table rows. Standard styles are great for use in a variety of common scenarios, but some content or your overall app design may call for a heavily customized table appearance. To learn how to create your own cells, see Customizing Cells in Table View Programming Guide for iOS.")
                        .font(.footnote)
                        .multilineTextAlignment(.leading)
                        .padding(.bottom, 10.0)
                    
                    Text("Most Contaced Tracker")
                        .font(.footnote)
                        .foregroundColor(Color.gray)
                        
                    
                    Text("doubleclick.net was prevented from profiling you across 2 websites")
                        .font(.footnote)
                        .padding(.bottom, 5.0)
                    
                    
                    Image("gambar_typo")
                        .resizable()
                        .frame(width: /*@START_MENU_TOKEN@*/360.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/231.0/*@END_MENU_TOKEN@*/)
                        .cornerRadius(10)
                        .aspectRatio(contentMode: .fit)
                        .clipped()
                    
                    Text("Design a custom table cell style for nonstandard table rows. Standard styles are great for use in a variety of common scenarios, but some content or your overall app design may call for a heavily customized table appearance. To learn how to create your own cells, see Customizing Cells in Table View Programming Guide for iOS.")
                        .font(.footnote)
                        .padding(.top, 5.0)
                        
                    Button(action: {
                        
                        print("ASHIAP")
                    }) {
                        Text("Take Assesment Quiz")
                            .font(.body)
                            .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                            .frame(width: /*@START_MENU_TOKEN@*/360.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/50.0/*@END_MENU_TOKEN@*/)
                            .background(Color("warna_button"))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                        
                    }
                    
                        
                    Spacer()
                    
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            }
        }
    }
}

struct CourseDetail_Previews: PreviewProvider {
    static var previews: some View {
        CourseDetail()
    }
}
