import Foundation
import FirebaseFirestoreSwift

struct users: Identifiable, Codable {
    @DocumentID var id: String?
    var Name: String
    var LastName: String
    var Age: String
    var Gender: String
    var Email: String
    var Password: String


    enum CodingKeys: String, CodingKey {
        case id
        case Name
        case LastName
        case Age
        case Gender
        case Email
        case Password
      }
}

