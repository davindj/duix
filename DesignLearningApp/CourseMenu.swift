//
//  ContentView.swift
//  Belajar
//
//  Created by Adimas Surya Perdana Putra on 11/06/21.
//

import SwiftUI

struct CourseMenu: View {
    var body: some View {
        ZStack{
            
            TabView {
                PageCourse()
                    .tabItem {
                        Image(systemName: "point.topleft.down.curvedto.point.bottomright.up")
                        Text("Path")
                    }
                
                PageCourse()
                    .tabItem {
                        Image(systemName: "book.closed.fill")
                        Text("Materials")
                    }
                
                PageCourse()
                    .tabItem {
                        Image(systemName: "paintpalette.fill")
                        Text("Reference")
                    }
                
                PageCourse()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
                
            }
            
        }
        
        
    }
}



struct CourseMenu_Previews: PreviewProvider {
    static var previews: some View {
        CourseMenu()
        
    }
}



struct PageCourse: View{
    var body: some View{
        
        
            ZStack{
                
               Background()
                
                VStack (spacing:5){
                    
                    LevelCourseTitle()
                        
                        LearningCourseTitle()
                        
                        BodyExplain()
                        
                        LessonsTitle()
                        
                        ListContent()
                
                
                
            }.padding(.top, 200)
        }.navigationBarTitle("", displayMode: .inline)
        
        
    }
}




struct Background: View{
    var body: some View{
        
        Image("top_bg")
            .resizable()
            .frame(width: 400, height: 265, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .padding(.bottom, 520)
        }
    }


struct LevelCourseTitle: View{
    var body: some View{
        
        Text("Beginner")
            .font(.title)
            
            .fontWeight(.bold)
            .foregroundColor(Color("titleColor"))
            .multilineTextAlignment(.leading)
            .padding(.trailing,231)
            .padding()
        
        }
    }



struct LearningCourseTitle: View{
    var body: some View{
        
        Text("Learn UI/UX Design from Scratch")
            .font(.title2)
            .fontWeight(.bold)
            .padding(.trailing,90.0)
            .foregroundColor(Color("Subtitle"))
        
        
        }
    }


struct BodyExplain: View{
    var body: some View{
        
        
        Text("Design a custom table cell style for nonstandard table rows. Standard styles are great for use in a variety of common scenarios, but some content or your overall app design may call for a heavily customized table appearance. To learn how to create your own cells, see Customizing Cells in Table View Programming Guide for iOS.")
            .font(.footnote)
            .padding()
            .padding(.horizontal,7)
            .multilineTextAlignment(.leading)
        
    }
}


struct LessonsTitle: View{
    var body: some View{
        Text("Lessons")
            .fontWeight(.bold)
            .padding(.trailing,265)
            .font(.title2)
            .foregroundColor(Color("Subtitle"))
        
        
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

struct ListContent: View {
    var body: some View{
        List{
            
            Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                
                Typhography()
                
            }.padding(.horizontal, 2)
            //.padding()
            .background(Color("Button"))
            .cornerRadius(15)
            .frame(width: 350, height: 100, alignment: .leading)
            
            
            Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                
                ColorPalette()
                
            }.padding(.horizontal, 2)
            //.padding()
            .background(Color("Button"))
            .cornerRadius(15)
            
            .frame(width: 350, height: 100, alignment: .leading)
            
            Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                
                ColorPalette()
                
            }.padding(.horizontal, 2)
            //.padding()
            .background(Color("Button"))
            .cornerRadius(15)
            
            .frame(width: 350, height: 100, alignment: .leading)
            
            Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                
                ColorPalette()
                
            }.padding(.horizontal, 2)
            //.padding()
            .background(Color("Button"))
            .cornerRadius(15)
            
            .frame(width: 350, height: 100, alignment: .leading)
            
            Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                
                ColorPalette()
                
            }.padding(.horizontal, 2)
            //.padding()
            .background(Color("Button"))
            .cornerRadius(15)
            
            .frame(width: 350, height: 100, alignment: .leading)
            
            Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                
                ColorPalette()
                
            }.padding(.horizontal, 2)
            //.padding()
            .background(Color("Button"))
            .cornerRadius(15)
            
            .frame(width: 350, height: 100, alignment: .leading)
            
            Button(action: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Action@*/{}/*@END_MENU_TOKEN@*/) {
                
                ColorPalette()
                
            }.padding(.horizontal, 2)
            //.padding()
            .background(Color("Button"))
            .cornerRadius(15)
            
            .frame(width: 350, height: 100, alignment: .leading)
        
        }
        
            
    }
}



