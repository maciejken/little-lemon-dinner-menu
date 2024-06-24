import SwiftUI

class MenuModel: ObservableObject {
    @Published var sections: Dictionary<MenuCategory, MenuSection> = [
        MenuCategory.food: MenuSection(name: "Food", visible: true, items: []),
        MenuCategory.drink: MenuSection(name: "Drinks", visible: true, items: []),
        MenuCategory.dessert: MenuSection(name: "Dessert", visible: true, items: [])
    ]
    @Published var showOptions: Bool = false
    @Published var sortBy: MenuSortBy = MenuSortBy.LetterAsc
    
    init() {
        fetchMenuItems()
        sortMenuItems()
    }
    
    func fetchMenuItems() {
        sections.keys.forEach({ menuCategory in
            sections[menuCategory]!.items = MockMenuItems.filter {
                $0.menuCategory == menuCategory
            }
        })
    }
    
    func viewOptions() {
        showOptions = true    }
    
    func hideOptions() {
        showOptions = false
    }
    
    func toggleMenuCategoryVisible(_ menuCategory: MenuCategory) {
        if var sectionVisibility = sections[menuCategory]?.visible {
            sectionVisibility.toggle()
        }
    }
    
    private func sortAllSectionsItems(by: (MenuItem, MenuItem) -> Bool) {
        MenuCategory.allCases.forEach { menuCategory in
            sections[menuCategory]!.items.sort(by: by)
        }
    }
    
    func sortMenuItems(by: MenuSortBy = MenuSortBy.LetterAsc) {
        sortBy = by
        switch (by) {
            case MenuSortBy.PopularityDesc:
                sortAllSectionsItems(by: {
                    $0.orderCount > $1.orderCount
                })
            case MenuSortBy.PriceAsc:
                sortAllSectionsItems(by: {
                    $0.price < $1.price
                })
            case MenuSortBy.LetterAsc:
                sortAllSectionsItems(by: {
                    $0.title < $1.title
                })
        }
    }
}
