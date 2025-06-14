import SwiftUI

struct MainView: View {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    @State private var currentDate: Date = Date()
    @StateObject var vm = MainViewModel()
    
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
                    List(vm.foodData) { food in
                        HStack {
                            if Calendar.current.isDate(currentDate, inSameDayAs: food.date) {
                                Text(food.name)
                                
                                Spacer()
                                
                                VStack{
                                    Text(vm.dateFormatter(date: food.date))
                                    Text(vm.timeFormatter(date: food.date))
                                }
                            }
                        }
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
