//
//  CustomTextField.swift
//  FoodTracker
//
//  Created by Александр Калашников on 13/6/25.
//

import SwiftUI

struct CustomTextField: View {
    let title: String
    @Binding var text: String
    var body: some View {
        ZStack {
            TextField(text: $text) {
                Text("\(title)")
                    .foregroundStyle(.black)
            }
            .foregroundStyle(.black)
            .padding()
            .background {
                ZStack {
                    Color.green
                        .cornerRadius(30)
                    
                    Color.white
                        .cornerRadius(30)
                        .padding(3)
                }
            }
        }
    }
}
