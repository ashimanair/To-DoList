//
//  To_DoListApp.swift
//  To-DoList
//
//  Created by Scholar on 6/11/24.
//hey

import SwiftUI
import SwiftData

@main
struct To_DoListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ToDoItem.self)
        }
    }
}
