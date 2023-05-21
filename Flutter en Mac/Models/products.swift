import Foundation
import FirebaseFirestoreSwift

struct Product: Identifiable, Codable {
    @DocumentID var id: String?
    var ID: String
    var Name: String
    var Description: String
    var Units: String
    var Cost: String
    var Price: String
    var Unity: String


    enum CodingKeys: String, CodingKey {
        case id
        case ID
        case Name
        case Description
        case Units
        case Cost
        case Price
        case Unity
      }
}
