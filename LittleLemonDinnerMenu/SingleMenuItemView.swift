import SwiftUI

struct SingleMenuItemView: View {
    var menuItem: MenuItem
    var body: some View {
        NavigationLink(destination: MenuItemDetailsView(menuItem: menuItem), label: {
            VStack {
                Text("")
                    .frame(width: 115, height: 75)
                    .background(Color.black)
                Text(menuItem.title)
                    .foregroundStyle(Color.black)
            }
        })
    }
}

#Preview {
    SingleMenuItemView(menuItem: MenuItem(
        price: 1.99,
        title: "Espresso",
        menuCategory: MenuCategory.drink,
        orderCount: 1999,
        ingredients: [Ingredient.coffee, Ingredient.water]
    ))
}
