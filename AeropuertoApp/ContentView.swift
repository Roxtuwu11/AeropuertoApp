//
//  ContentView.swift
//  AeropuertoApp
//
//  Created by MAC on 20/09/22.
//

import SwiftUI

struct ContentView: View {
    @State var radius: Float = 0.0
    @State var isEditing: Bool = false
       
       var body: some View {
           NavigationView{
           ZStack {
               AiportColor.mainColor
                   .ignoresSafeArea()
            VStack {
                Text("AIRPORT")
                    .font(.system(size: 50))
                    .bold()
                    
                Text("finder")
                    .font(.system(size: 20))
                    .bold()
                Spacer().frame(height:50)
                VStack{
                    Text("\(String(format: "%.0f", radius))")
                        .foregroundColor(isEditing ? .green : .black)
                        .font(.system(size: 50))
                    Slider(value: $radius,
                           in: 1...500,
                           step: 1,
                           onEditingChanged: { editing in
                            isEditing = editing
                    }
                    )
                    .padding(.leading, 10)
                    .padding(.trailing, 10)
                   
                    Text("RADIUS IN KM")
                        .font(.body)
                        
                    
                }
                Spacer()
                NavigationLink(destination: MainTabView(radius: $radius), label: {
                        BottomTextView(str: "SEARCH")
                    
                })
                
            } .foregroundColor(.white)
          
           }
           
       }
           .navigationTitle("Home")
       }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
