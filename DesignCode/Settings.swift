//
//  Settings.swift
//  DesignCode
//
//  Created by 杨晓明 on 2019/11/2.
//  Copyright © 2019 AlbatroFE. All rights reserved.
//

import SwiftUI

struct Settings: View {
    @State var receive = false
    @State var number = 1
    @State var selection = 1
    @State var date = Date()
    @State var email = ""
    @State var submit = false
    
    var body: some View {
        NavigationView {
            Form {
                Toggle(isOn: self.$receive) {
                    Text("Receive Notifications")
                }
                Stepper(value: self.$number, in: 1...10) {
                    Text("\(number) Notification\(number > 1 ? "s" : "") per week")
                }
                Picker(selection: $selection, label: Text("Favorite course")) {
                    Text("SwiftUI").tag(1)
                    Text("React").tag(2)
                }
                DatePicker(selection: $date, label: { Text("Date") })
                Section(header: Text("Email")) {
                    TextField("Your Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                Button(action: { self.submit.toggle() }) {
                    Text("Submit")
                }.alert(isPresented: $submit) {
                    Alert(title: Text("ok, Thanks!"), message: Text("Email:\(email)"))
                }
            }.navigationBarTitle("Settings")
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
