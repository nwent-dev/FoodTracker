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
                
                VStack(alignment: .leading) {
                    DatePicker(selection: $currentDate, displayedComponents: .date) {
                        Text("Displayed day")
                            .foregroundStyle(.black)
                    }
                    .padding()
                    
                    Text("You ate \(vm.getFoodCountForDay(date: currentDate)) meals today:")
                        .foregroundStyle(.black)
                        .padding()
                    
                    List {
                        ForEach(foods) { food in
                            if Calendar.current.isDate(currentDate, inSameDayAs: food.date) {
                                HStack {
                                    Text(food.name)
                                        .foregroundStyle(.black)
                                        .frame(maxWidth: .infinity)
                                        .padding()
                                        .background {
                                            Color.black.opacity(0.2)
                                                .cornerRadius(30)
                                        }
                                        
                                    Spacer()
                                    
                                    VStack {
                                        Text("\(food.weight) gm")
                                        Text(vm.timeFormatter(date: food.date))
                                    }
                                    .foregroundStyle(.black)
//                                    .frame(maxWidth: .infinity)
                                    .bold()
                                    .padding()
                                    .background {
                                        Color.black.opacity(0.2)
                                            .cornerRadius(30)
                                    }
                                }
                                .listRowBackground(Color.white)
                                .background {
                                    Color.white
                                }
                            }
                        }
                        .onDelete(perform: $foods.remove)
                    }
                    .listStyle(.inset)
                    .scrollContentBackground(.hidden)
                    
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
                    .frame(maxWidth: .infinity, alignment: .center)

                }
            }
        }
    }
}

#Preview {
    MainView()
}
