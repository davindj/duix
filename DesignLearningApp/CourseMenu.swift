//
//  ContentView.swift
//  Belajar
//
//  Created by Adimas Surya Perdana Putra on 11/06/21.
//

import SwiftUI

struct CourseMenu: View {
    var courseTitle : String

    var body: some View {
        ScrollView(.vertical){
            VStack(spacing:5){
                //MARK: - BANNER AND LEVEL
                ZStack{
                    Image("top_bg")
                        .resizable()
                        .scaledToFit()
                        .frame(width: .infinity, height: 265)
                        .mask(Rectangle().frame(width: .infinity, height: 265, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/))
                    VStack{
                        Spacer()
                        Text(courseTitle)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color("titleColor"))
                            .multilineTextAlignment(.leading)
                            .padding(.leading, 25)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    }
                }
                //MARK: - LEARNING PATH NAME
                Text("Learn UI/UX Design from Scratch")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color("Subtitle"))
                    .padding(.leading, 25)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                //MARK: - BODY
                Text("Design a custom table cell style for nonstandard table rows. Standard styles are great for use in a variety of common scenarios, but some content or your overall app design may call for a heavily customized table appearance. To learn how to create your own cells, see Customizing Cells in Table View Programming Guide for iOS.")
                    .font(.footnote)
                    .padding()
                    .padding(.horizontal,8)
                    .multilineTextAlignment(.leading)
                //MARK: - LESSONS
                Text("Lessons")
                    .fontWeight(.bold)
                    .padding(.leading, 25)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                    .font(.title2)
                    .foregroundColor(Color("Subtitle"))
                VStack{
                    LessonsItem(title: "Typography", desc: "Design a custom table cell style for nonstandard table rows. ", image: "Asset_Tyh")
                    LessonsItem(title: "Color Palette", desc: "Design a custom table cell style for nonstandard table rows.", image: "Asset_CP")
                }.padding(.horizontal, 20)
                
            }
        }
//        .ignoresSafeArea(.all, edges:.top)
        .navigationBarTitle(courseTitle, displayMode: .automatic)
//        .navigationBarHidden(true)
    }
}

struct CourseMenu_Previews: PreviewProvider {
    static var previews: some View {
        CourseMenu(courseTitle: "Beginer")
    }
}


struct LessonsItem: View{
    var title: String
    var desc: String
    var image : String
    var body: some View{
        NavigationLink(destination: CourseDetail()){
            HStack{
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fit )
                    .frame(width: 90, height: 100, alignment: .center)
                VStack (alignment: .leading, spacing: 10){
                    Text(title)
                        .font(.callout)
                        .foregroundColor(Color("Subtitle"))
                    Text(desc)
                        .font(.caption2)
                        .padding(.trailing,30)
                }
            }
            .padding(.horizontal)
            .background(Color("appPrimaryColor").opacity(0.2))
            .mask(RoundedRectangle(cornerRadius: 11))
        }
    }
}

struct Typhography: View{
    var body: some View{
        HStack{
            Image("Asset_Tyh")
                .resizable()
                .frame(width: 120, height: 100, alignment: .center)
            VStack (alignment: .leading, spacing: 10){
                Text("Typhography")
                    .font(.callout)
                    .foregroundColor(Color("Subtitle"))
                Text("Design a custom table cell style for nonstandard table rows.  ")
                    .font(.caption2)
                    .padding(.trailing,30)
            }
        }
    }
}

struct ColorPalette: View{
    var body: some View{
        HStack{
            Image("Asset_CP")
                .resizable()
                .frame(width: 80, height: 90, alignment: .center)
                .padding(.horizontal, 20)
            VStack (alignment: .leading, spacing: 10) {
                Text("Color Palette")
                    .font(.callout)
                    .foregroundColor(Color("Subtitle"))
                    
                Text("Design a custom table cell style for nonstandard table rows.  ")
                    .font(.caption2)
                    .foregroundColor(.black)
                    .padding(.trailing, 30)
            }
        }
    }
}



