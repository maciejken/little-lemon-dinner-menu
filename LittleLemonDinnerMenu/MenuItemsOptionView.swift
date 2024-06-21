import SwiftUI

struct MenuItemsOptionView: View {
    @ObservedObject var menuModel: MenuModel
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Button("Done") {
                    menuModel.hideOptions()
                }
                .padding()
            }
            Text("Filter")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .padding()
            List {
                Section("selected categories") {
                    ForEach(MenuCategory.allCases, id: \.self) { category in
                        Text(category.rawValue)
                    }
                }
                Section("sort by") {
                    ForEach(SortBy.allCases, id: \.self) { sortBy in
                        Text(sortBy.rawValue)
                    }
                }
            }
            .listStyle(.grouped)
        }
        .background(Color(.systemGray6))

        Spacer()
    }
}

#Preview {
    MenuItemsOptionView(menuModel: MenuModel())
}
