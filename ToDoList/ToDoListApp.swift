//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by FFK on 27.09.2023.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
