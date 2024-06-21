import SwiftUI

struct MenuSection: View {
    private let adaptiveCols = [
        GridItem(.adaptive(minimum: 115)),
    ]
    var title: String
    var items: [MenuItem]
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title3)
            LazyVGrid(columns: adaptiveCols) {
                ForEach(items) { item in
                    SingleMenuItemView(menuItem: item)
                }
            }
        }
    }
}

#Preview {
    MenuSection(title: "Drinks", items: [
        MenuItem(
            price: 1.99,
            title: "Espresso",
            menuCategory: MenuCategory.drink,
            orderCount: 19234,
            ingredients: [Ingredient.water, Ingredient.coffee]
        )
    ])
}
