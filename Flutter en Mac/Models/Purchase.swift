import Foundation
import FirebaseFirestoreSwift

struct Purchase: Identifiable, Codable {
    @DocumentID var id: String?
    var ID: String
    var name: String
    var pieces: String
    var idAdmin: String


    enum CodingKeys: String, CodingKey {
        case id
        case ID
        case name
        case pieces
        case idAdmin
      }
}
