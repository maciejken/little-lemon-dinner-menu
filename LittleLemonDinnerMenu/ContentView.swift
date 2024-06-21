import SwiftUI

struct ContentView: View {
    @ObservedObject var menuModel = MenuModel()
    var body: some View {
        NavigationStack {
            MenuItemsView(menuModel: menuModel)
            ScrollView {
                MenuSection(title: "Food", items: menuModel.foodItems)
                MenuSection(title: "Drinks", items: menuModel.drinkItems)
                MenuSection(title: "Dessert", items: menuModel.dessertItems)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
