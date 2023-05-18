import Foundation
import FirebaseFirestoreSwift

struct Product: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var description: String
    var unit: String
    var cost: String
    var price: String
    var utility: String


    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case unit
        case cost
        case price
        case utility
      }
}
