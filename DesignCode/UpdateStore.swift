//
//  UpdateStore.swift
//  DesignCode
//
//  Created by 杨晓明 on 2019/11/1.
//  Copyright © 2019 AlbatroFE. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    let didChange = PassthroughSubject<Void, Never>()
    
    @Published var updates: [Update] = []
    
    init(updates: [Update] = []) {
        self.updates = updates
    }
}
