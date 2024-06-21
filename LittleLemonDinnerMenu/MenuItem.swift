import SwiftUI

protocol MenuItemProtocol: Identifiable {
    var id: UUID { get }
    var price: Double { get }
    var title: String { get }
    var menuCategory: MenuCategory { get }
    var orderCount: Int { get set }
    var ingredients: [Ingredient] { get set }
}

struct MenuItem: MenuItemProtocol {
    var id = UUID()
    var price: Double
    var title: String
    var menuCategory: MenuCategory
    var orderCount: Int
    var ingredients: [Ingredient]
}
