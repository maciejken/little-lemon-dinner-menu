import SwiftUI

struct MenuItemsView: View {
    @ObservedObject var menuModel: MenuModel
    var body: some View {
        Text("")
            .frame(width: 0, height: 0)
            .navigationTitle("Menu")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        menuModel.viewOptions()
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                    }
                    .popover(isPresented: $menuModel.showOptions) {
                        MenuItemsOptionView(menuModel: menuModel)
                    }
                }
            }
        }
}

#Preview {
    NavigationStack {
        MenuItemsView(menuModel: MenuModel())
    }
}
