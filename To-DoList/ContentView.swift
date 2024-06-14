//
//  ContentView.swift
//  To-DoList
//
//  Created by Scholar on 6/11/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State private var showNewTask = false
    @Query var ToDos: [ToDoItem]
    @Environment (\.modelContext) var modelContext
    
    var body: some View {
        ZStack{
            VStack {
                HStack{
                    Text("To-Do List")
                        .font(.system(size:40))
                        .fontWeight(.heavy)
                    Spacer()
                    
                    Button{
                        withAnimation{
                            self.showNewTask = true
                        }
                    } label: {
                        Text("+")
                            .font(.title)
                            .bold()
                        
                    }
                }
                .padding()
            }
            Spacer()
            
            List {
                ForEach(ToDos){ toDoItem in
                    if (toDoItem.isImportant == true) {
                        Text("‼️" + toDoItem.title)
                    }
                    else {
                        Text(toDoItem.title)
                    }
                    
                }
                
                .onDelete(perform: deleteToDo)
                
            }
            .listStyle(.plain)
            
            if (showNewTask){
                NewToDoView(toDoItem : ToDoItem(title : "", isImportant: false) , showNewTask : $showNewTask)
                
            }
        }
        
        func deleteToDo (at offsets : IndexSet) {
            for offset in offsets {
                let toDoItem = ToDos[offset]
                modelContext.delete(toDoItem)
            }
        }
        
    }
}

#Preview {
    ContentView()
}
