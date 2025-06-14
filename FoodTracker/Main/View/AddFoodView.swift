//
//  AddFoodView.swift
//  FoodTracker
//
//  Created by Александр Калашников on 13/6/25.
//

import SwiftUI
import RealmSwift

struct AddFoodView: View {
    @State private var foodName: String = ""
    @State private var foodWeight: String = ""
    @State private var foodDate: Date = Date()
    
    @ObservedObject var vm: MainViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea()
            
            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .resizable()
                            .scaledToFit()
                            .frame(width: UIScreen.main.bounds.width * 0.02)
                            .foregroundStyle(.green)
                        Text("Back")
                            .foregroundStyle(.green)
                    }
                    
                    Spacer()
                }
                Spacer()
                
                CustomTextField(title: "What did you eat?", text: $foodName)
                
                CustomTextField(title: "How much did you eat? (in gramms)", text: $foodWeight)
                    .keyboardType(.numberPad)
                
                DatePicker(selection: $foodDate, displayedComponents: .hourAndMinute) {
                    Text("When you ate it?")
                        .foregroundStyle(.black)
                }
                .padding()
                .background {
                    ZStack {
                        Color.green
                            .cornerRadius(40)
                        
                        Color.white
                            .cornerRadius(40)
                            .padding(3)
                    }
                }
                
                Spacer()
                
                Button {
                    vm.addFood(name: foodName, weight: Int(foodWeight) ?? 0, date: foodDate)
                    dismiss()
                } label: {
                    Text("Done")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.white)
                        .padding()
                        .background {
                            Color.green
                                .cornerRadius(40)
                        }
                }
            }
            .padding()
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    @StateObject var vm = MainViewModel()
    AddFoodView(vm: vm)
}
