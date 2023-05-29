import Foundation
import FirebaseFirestoreSwift

struct Product: Identifiable, Codable {
    @DocumentID var id: String?
    var ID: String
    var Name: String
    var Description: String
    var Category: String
    var Gender: String
    var Types: String
    var Units: String
    var Price: String
    var TotalFinal: String


    enum CodingKeys: String, CodingKey {
        case id
        case ID
        case Name
        case Description
        case Category
        case Gender
        case Types
        case Units
        case Price
        case TotalFinal
      }
}
