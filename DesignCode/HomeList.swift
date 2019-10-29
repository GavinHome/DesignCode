//
//  HomeList.swift
//  DesignCode
//
//  Created by 杨晓明 on 2019/10/28.
//  Copyright © 2019 AlbatroFE. All rights reserved.
//

import SwiftUI

struct HomeList: View {
    var courses = coursesData
    @State private var showModal = false
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Courses")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    Text("22 courses")
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding(.leading, 70)
            .padding(.bottom, 40)
            
            ScrollView(Axis.Set.horizontal, showsIndicators: false) {
                HStack(spacing: 30) {
                    ForEach(courses) { item in
                        Button(action: { self.showModal.toggle() }) {
                            HStack {
                                CourseView(course: item)
                            }
                        }
                    }
                }
                .sheet(isPresented: self.$showModal) {
                    ContentView()
                }
                .padding(.leading, 40)
            }
            
            Spacer()
        }
        .padding(.top, 78)
        
    }
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}

struct CourseView: View {
    var course: Course
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.course.title)
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
                .padding(30)
                .lineLimit(4)
                .padding(.trailing, 50)
            Spacer()
            Image(self.course.icon)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 246, height: 200)
                .padding(.bottom, 30)
        }
        .background(self.course.color)
        .cornerRadius(30)
        .frame(width: 246, height: 360)
        .shadow(color: self.course.shdowColor, radius: 20, x: 0, y: 20)
    }
}

struct Course: Identifiable {
    var id = UUID()
    var title: String
    var icon: String
    var color: Color
    var shdowColor: Color
}

let coursesData = [
    Course(
        title: "Build an app with SwiftUI",
        icon: "Illustration1",
        color: Color("background3"),
        shdowColor: Color("shadow3")
    ),
    Course(
        title: "Design Course",
        icon: "Illustration2",
        color: Color("background4"),
        shdowColor: Color("shadow4")
    )
]
