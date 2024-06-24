import SwiftUI

struct ContentView: View {
    @ObservedObject var menuModel = MenuModel()
    var body: some View {
        NavigationStack {
            MenuItemsView(menuModel: menuModel)
            ScrollView {
                ForEach(MenuCategory.allCases, id: \.self) { menuCategory in
                    let menuSection = menuModel.sections[menuCategory]
                    if menuSection!.visible {
                        MenuSectionView(title: menuSection!.name, items: menuSection!.items)
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
