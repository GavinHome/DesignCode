//
//  UpdateList.swift
//  DesignCode
//
//  Created by 杨晓明 on 2019/10/29.
//  Copyright © 2019 AlbatroFE. All rights reserved.
//

import SwiftUI

struct UpdateList: View {
    @State var showSetting = false
    var updates = updateDate
    @ObservedObject var store = UpdateStore(updates: updateDate)
    
    var body: some View {
        NavigationView {
            VStack {
//                Button(action: {
//                    self.store.updates.append(Update(image: "Illustration1", title: "newTitle", text: "newText", date: "JUN 26"))
//                }) {
//                    Text("Add Item").foregroundColor(.white)
//                }
//                .padding(8)
//                .background(Color("background3"))
//                .cornerRadius(8)
                
                List {
                    ForEach(store.updates) { item in
                        NavigationLink(destination: UpdateDetail(update: item)) {
                            HStack(spacing: 12.0) {
                                Image(item.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 80, height: 80)
                                    .background(Color("background"))
                                    .cornerRadius(20)
                                
                                VStack(alignment: .leading) {
                                    Text(item.title)
                                        .font(.headline)
                                    Text(item.text)
                                        .lineLimit(2)
                                        .lineSpacing(4)
                                        .font(.subheadline)
                                        .frame(height: 50)
                                    Text(item.date)
                                        .font(.caption)
                                        .fontWeight(.bold)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                        .padding(.vertical, 8)
                    }
                    .onDelete { indexSet in
                        self.store.updates.remove(at: indexSet.first!)
                    }.onMove { indecies, newOffset in
                        self.store.updates.move(fromOffsets: indecies, toOffset: newOffset)
                    }
                }
                .navigationBarTitle(Text("Updates"))
                .navigationBarItems(
                    leading: Button(action: {
                        self.store.updates.append(Update(image: "Illustration1", title: "newTitle", text: "newText", date: "JUN 26"))
                    }) {
                        Image(systemName: "plus")
                    },
                    trailing: EditButton()
                )
            }
            .sheet(isPresented: self.$showSetting) {
                Text("Settings")
            }
        }
    }
}

struct UpdateList_Previews: PreviewProvider {
    static var previews: some View {
        UpdateList()
    }
}


struct Update: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var text: String
    var date: String
}

let updateDate = [
    Update(image: "Illustration1", title: "swiftui", text: "大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话公司工会", date: "JUN 26"),
    Update(image: "Illustration2", title: "swiftui", text: "大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话公司工会", date: "JUN 26"),
    Update(image: "Illustration3", title: "swiftui", text: "大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话公司工会", date: "JUN 26"),
    Update(image: "Illustration4", title: "swiftui", text: "大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话公司工会", date: "JUN 26"),
    Update(image: "Certificate1", title: "swiftui", text: "大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话公司工会", date: "JUN 26"),
    Update(image: "Certificate2", title: "swiftui", text: "大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话公司工会", date: "JUN 26"),
    Update(image: "Certificate3", title: "swiftui", text: "大家忽视覅偶尔回复而韩国is的hi多少个is多个收到货IGis个his读后感is多个hi韩国ID深V出魔抗VBUI欧盟是的归属感就是 属地化工is多个hi是个 是个hi第三帝国会死哦低功耗is电话公司工会", date: "JUN 26"),
]
