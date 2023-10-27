//
//  NoItemsView.swift
//  ToDoList
//
//  Created by FFK on 27.09.2023.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Text("There are no items")
                    .font(.title)
                    .fontWeight(.semibold)
                Text("Are you a productive person ? I think you should click the add button and add a bunch of times to your toDo List !")
                padding(.bottom, 20)
                NavigationLink (
                    destination: AddView(),
                    label: {
                        Text("Add Something 😊")
                            .foregroundColor(.white)
                            .font(.headline)
                            .frame(height: 55)
                            .frame(maxWidth: .infinity)
                            .background(animate ? Color.red : Color.blue)
                            .cornerRadius(10)
                    } )
                .padding(.horizontal , animate ? 30 : 50)
                .shadow(
                    color: animate ? Color.red.opacity(0.7) : Color.blue.opacity(0.7),
                    radius: animate ? 30 : 10,
                    x: 0,
                    y: animate ? 50 : 30 )
                .scaleEffect(animate ? 1.1 : 1.0)
                .offset(y: animate ? -7 : 0)
            }
            .multilineTextAlignment(.center)
            .padding(40)
            .onAppear(perform: addAnimation)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
    func addAnimation() {
        guard !animate else { return }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(
                Animation
                    .easeInOut(duration: 2.0)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

struct NoItemsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoItemsView()
                .navigationTitle("Title")
        }
    }
}
