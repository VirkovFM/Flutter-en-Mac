import Foundation
import FirebaseFirestoreSwift

struct Sale: Identifiable, Codable {
    @DocumentID var id: String?
    var ID: String
    var name: String
    var cant: String
    var idProduct: String
    var idClient: String
    var pieces: String
    var subtotal: String
    var total: String


    enum CodingKeys: String, CodingKey {
        case id
        case ID
        case name
        case cant
        case idProduct
        case idClient
        case pieces
        case subtotal
        case total
      }
}
