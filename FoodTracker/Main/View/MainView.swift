import SwiftUI
import RealmSwift

struct MainView: View {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    @State private var currentDate: Date = Date()
    @StateObject var vm = MainViewModel()
    
    @ObservedResults(Food.self) var foods
    
    var body: some View {
        NavigationView {
            ZStack {
                // background
                Color.white.ignoresSafeArea()
                
                VStack {
                    DatePicker(selection: $currentDate, displayedComponents: .date) {
                        Text("Displayed day")
                    }
                    .padding()
                    List {
                        ForEach(foods) { food in
                            if Calendar.current.isDate(currentDate, inSameDayAs: food.date) {
                                HStack {
                                    Text(food.name)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background {
                                            Color.black.opacity(0.2)
                                                .cornerRadius(30)
                                        }
                                        
                                    Text("\(food.weight) gm")
                                        .frame(maxWidth: .infinity)
                                        .bold()
                                        .padding()
                                        .background {
                                            Color.black.opacity(0.2)
                                                .cornerRadius(30)
                                        }
                                    
                                    Spacer()
                                    
                                    VStack{
                                        Text(vm.dateFormatter(date: food.date))
                                        Text(vm.timeFormatter(date: food.date))
                                    }
                                    .frame(maxWidth: .infinity, alignment: .trailing)
                                }
                            }
                        }
                        .onDelete(perform: $foods.remove)
                    }
                    .listStyle(.inset)
                    
                    Spacer()
                    
                    NavigationLink {
                        AddFoodView(vm: vm)
                    } label: {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .scaledToFit()
                            .frame(width: width * 0.15)
                            .foregroundStyle(.green)
                    }

                }
            }
        }
    }
}

#Preview {
    MainView()
}
