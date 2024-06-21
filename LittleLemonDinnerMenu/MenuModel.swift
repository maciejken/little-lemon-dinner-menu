import SwiftUI

let mockData = MockData()

class MenuModel: ObservableObject {
    @Published var foodItems: [MenuItem] = []
    @Published var showFoodItems: Bool = true
    @Published var drinkItems: [MenuItem] = []
    @Published var showDrinks: Bool = true
    @Published var dessertItems: [MenuItem] = []
    @Published var showDesserts: Bool = true
    @Published var showOptions: Bool = false
    
    init() {
        fetchMenuItems()
    }
    
    func fetchMenuItems() {
        self.foodItems = mockData.foodItems
        self.drinkItems = mockData.drinkItems
        self.dessertItems = mockData.dessertItems
    }
    
    func viewOptions() {
        showOptions = true    }
    
    func hideOptions() {
        showOptions = false
    }
}
