//
//  UpdateDetail.swift
//  DesignCode
//
//  Created by 杨晓明 on 2019/10/29.
//  Copyright © 2019 AlbatroFE. All rights reserved.
//

import SwiftUI

struct UpdateDetail: View {
    var update: Update = Update(image: "Illustration1", title: "Swiftui", text: "Loading", date: "")
    var body: some View {
        VStack(spacing: 20.0) {
            Text(update.title)
                .font(.largeTitle)
                .fontWeight(.heavy)
            
            Image(update.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
            
            Text(update.text)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            Spacer()
        }
        .padding(30.0)
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
