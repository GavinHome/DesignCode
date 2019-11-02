//
//  TabBar.swift
//  DesignCode
//
//  Created by 杨晓明 on 2019/11/2.
//  Copyright © 2019 AlbatroFE. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView {
            Home().tabItem{
                VStack {
                    Image(systemName: "house")
                    Text("Home")
                }
            }.tag(1)
            ContentView().tabItem{
                VStack {
                    Image(systemName: "rectangle.on.rectangle")
                    Text("Certificates")
                }
            }.tag(2)
            Settings().tabItem{
                VStack {
                    Image(systemName: "gear")
                    Text("Settings")
                }
            }.tag(3)
        }
        .accentColor(.black)
        .edgesIgnoringSafeArea(.top)
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBar().previewDevice("iPhone SE")
            TabBar().previewDevice("iPhone Xʀ")
            TabBar().previewDevice("iPhone Xs Max")
            TabBar().previewDevice("iPad Pro (9.7-inch)")
            
            TabBar()
            TabBar()
                .environment(\.colorScheme, .dark)
                .environment(\.sizeCategory, .extraSmall)
        }
    }
}
