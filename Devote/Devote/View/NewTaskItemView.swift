//
//  NewTaskItemView.swift
//  Devote
//
//  Created by Erasmo J.F Da Silva on 26/07/21.
//  SwiftUI ♡ Better Apps. Less Code
//  https://erasmojf.github.io/
//  Fidju de Bideira de Feira de Caracol

import SwiftUI

struct NewTaskItemView: View {
    // MARK: - PROPERTIES
    @Environment(\.managedObjectContext) private var viewContext
    @State private var task: String = ""
    
    @Binding var isShowing: Bool
    
    private var isButtonDesabled: Bool {
        task.isEmpty
    }
    
    // MARK: - FUNCTIONN
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.completion = false
            newItem.id = UUID()
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            task = ""
            hideKeyboard()
            isShowing = false
        }
    }
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            Spacer()
            VStack (spacing: 16) {
                TextField("New Task", text: $task)
                    .foregroundColor(.pink)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding()
                    .background(
                        Color(UIColor.systemGray6)
                    )
                    .cornerRadius(10)
                
                Button(action: {
                    addItem()
                }, label: {
                    Spacer()
                    Text("SAVE")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    Spacer()
                })//BUTTON
                .disabled(isButtonDesabled)
                .padding()
                .foregroundColor(.white)
                .background(isButtonDesabled ? Color.blue : Color.pink)
                .cornerRadius(10)
            }//VStack
            .padding(.horizontal)
            .padding(.vertical, 16)
            .background(
                Color.white
            )
            .cornerRadius(16)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.65), radius: 24)
            .frame(maxWidth: 640)
        }//VStack
        .padding()
    }
}

// MARK: - PREVIEW

struct NewTaskItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskItemView(isShowing: .constant(true))
            .background(Color.gray.edgesIgnoringSafeArea(.all))
    }
}
