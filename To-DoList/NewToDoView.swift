//
//  NewToDoView.swift
//  To-DoList
//
//  Created by Scholar on 6/11/24.
//

import SwiftUI
import SwiftData

struct NewToDoView: View {
    
    @Bindable var toDoItem : ToDoItem
    @Environment(\.modelContext) var modelContext
    @Binding var showNewTask : Bool
    
    var body: some View {
        VStack{
            Text("Task Title: ")
                .font(.title)
                .bold()
            
            TextField("Enter the Task Description ..." , text: $toDoItem.title, axis: .vertical)
                .padding()
                .background(Color(.systemGroupedBackground))
                .cornerRadius(15)
            
            
            Toggle(isOn: $toDoItem.isImportant) {
                    Text("Is it Important?")
                    .padding()
                }
            Button {
                addToDo()
                self.showNewTask = false
                
            } label: {
                Text("Save")
            }
        }
        .padding()
    }
    
    func addToDo(){
        let toDo = ToDoItem(title: toDoItem.title, isImportant: toDoItem.isImportant)
        modelContext.insert(toDo)
    }
    
}

/*#Preview {
 NewToDoView()
 }
 */
