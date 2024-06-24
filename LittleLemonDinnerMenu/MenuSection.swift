import SwiftUI

protocol MenuSectionProtocol: Identifiable {
    var id: UUID { get }
    var name: String { get }
    var visible: Bool { get set }
    var items: [MenuItem] { get set }
}

struct MenuSection: MenuSectionProtocol {
    var id: UUID = UUID()
    var name: String
    var visible: Bool
    var items: [MenuItem]
}
