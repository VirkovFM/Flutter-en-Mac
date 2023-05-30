import Foundation
import FirebaseFirestoreSwift

struct Purchase: Identifiable, Codable {
    @DocumentID var id: String?
    var ID: String
    var IdSale: String
    var idAdmin: String
    var Name: String


    enum CodingKeys: String, CodingKey {
        case id
        case ID
        case IdSale
        case idAdmin
        case Name
      }
}
