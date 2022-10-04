//
//  ButtonTextView.swift
//  AeropuertoApp
//
//  Created by MAC on 21/09/22.
//

import SwiftUI


struct BottomTextView: View {
    let str: String
 
    var body: some View {
        HStack {
            Spacer()
            Text(str)
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding()
                .cornerRadius(10)
                .shadow(radius: 10)
            Spacer()
        }.background(AiportColor.accentColor)
    }
}

struct BottomTextView_Previews: PreviewProvider {
    static var previews: some View {
        BottomTextView(str: "Test")
    }
}
