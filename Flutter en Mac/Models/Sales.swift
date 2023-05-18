import Foundation
import FirebaseFirestoreSwift

struct User: Identifiable, Codable {
    @DocumentID var id: String?
    var name: String
    var lastName: String
    var age: String
    var gender: String
    var email: String
    var password: String
    var rol: String


    enum CodingKeys: String, CodingKey {
        case id
        case name
        case lastName
        case age
        case gender
        case email
        case password
        case rol
      }
}
