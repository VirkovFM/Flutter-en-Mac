import Foundation
import FirebaseFirestoreSwift

struct Purchase: Identifiable, Codable {
    @DocumentID var id: String?
    var ID: String
    var Name: String
    var Pieces: String
    var IdAdmin: String


    enum CodingKeys: String, CodingKey {
        case id
        case ID
        case Name
        case Pieces
        case IdAdmin
      }
}
