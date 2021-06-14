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
                    
                    title()
                        
                    subline()
                        
                    tracker()
                    
                    gambar()
                    
                    subline2()
                    
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

struct title: View {
    var body: some View {
        Text("Typography Basics")
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(Color("judul"))
            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
            .padding(.bottom, 5.0)
    }
}

struct subline: View {
    var body: some View {
        Text("Design a custom table cell style for nonstandard table rows. Standard styles are great for use in a variety of common scenarios, but some content or your overall app design may call for a heavily customized table appearance. To learn how to create your own cells, see Customizing Cells in Table View Programming Guide for iOS.")
            .font(.footnote)
            .fontWeight(.regular)
            .multilineTextAlignment(.leading)
    }
}

struct tracker: View {
    var body: some View {
        Text("Most Contaced Tracker")
            .font(.body)
            .fontWeight(.regular)
            .foregroundColor(Color.gray)
            .padding(.top)
            
        
        Text("doubleclick.net was prevented from profiling you across 2 websites")
            .font(.body)
            .fontWeight(.semibold)
            .padding(.bottom, 5.0)
    }
}

struct gambar: View {
    var body: some View {
        Image("gambar_typo")
            .resizable()
            .frame(width: /*@START_MENU_TOKEN@*/360.0/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/231.0/*@END_MENU_TOKEN@*/)
            .cornerRadius(10)
            .aspectRatio(contentMode: .fit)
            .clipped()
    }
}

struct subline2: View {
    var body: some View {
        Text("Design a custom table cell style for nonstandard table rows. Standard styles are great for use in a variety of common scenarios, but some content or your overall app design may call for a heavily customized table appearance. To learn how to create your own cells, see Customizing Cells in Table View Programming Guide for iOS.")
            .font(.footnote)
            .fontWeight(.regular)
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
        .padding(.top)
    }
}

