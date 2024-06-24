import XCTest
@testable import LittleLemonDinnerMenu

final class MenuItemTests: XCTestCase {
    func testMenuItemTitle() {
        let menuItem = MenuItem(price: 9.99, title: "Example", menuCategory: MenuCategory.food, orderCount: 123, ingredients: [])
        XCTAssertEqual(menuItem.title, "Example")
    }
    func testMenuItemIngredients() {
        let menuItem = MenuItem(price: 9.99, title: "Example", menuCategory: MenuCategory.food, orderCount: 123, ingredients: [Ingredient.coffee, Ingredient.water])
        XCTAssertEqual(menuItem.ingredients, [Ingredient.coffee, Ingredient.water])
    }
}
