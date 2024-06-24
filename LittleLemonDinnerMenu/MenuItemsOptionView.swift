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
                    ForEach(MenuCategory.allCases, id: \.self) { menuCategory in
                        Button {
                            menuModel.sections[menuCategory]!.visible.toggle()
                        } label: {
                            HStack {
                                Text(menuCategory.rawValue)
                                Spacer()
                                if menuModel.sections[menuCategory]!.visible {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                        .foregroundColor(.black)
                        
                    }
                }
                Section("sort by") {
                    ForEach(MenuSortBy.allCases, id: \.self) { sortBy in
                        Button {
                            menuModel.sortMenuItems(by: sortBy)
                        } label: {
                            HStack {
                                Text(sortBy.rawValue)
                                Spacer()
                                if menuModel.sortBy == sortBy {
                                    Image(systemName: "checkmark")
                                }
                            }
                            .foregroundColor(.black)
                        }
                        
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
