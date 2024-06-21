import SwiftUI

struct MenuItemDetailsView: View {
    var menuItem: MenuItem
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text(menuItem.title)
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Image("LittleLemon_Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250)
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/) {
                    Text("Price:")
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Text(String(menuItem.price))
                    Text("Ordered:")
                        .fontWeight(.bold)
                    Text(String(menuItem.orderCount))
                    Text("Ingredients:")
                        .fontWeight(.bold)
                    ForEach(menuItem.ingredients, id: \.self) { ingredient in
                        Text(ingredient.rawValue)
                    }
                }
                .frame(width: 250)
                Spacer()
            }
        }    }
}

#Preview {
    MenuItemDetailsView(menuItem: MenuItem(
        price: 1.99,
        title: "Espresso",
        menuCategory: MenuCategory.drink,
        orderCount: 1999,
        ingredients: [Ingredient.coffee, Ingredient.water]
    ))
}
