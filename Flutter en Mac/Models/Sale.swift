import Foundation
import FirebaseFirestoreSwift

struct Sale: Identifiable, Codable {
    @DocumentID var id: String?
    var ID: String
    var IdCliente: String
    var IdProduct: String
    var NameProduct: String
    var Pieces: String
    var Subtotal: String
    var Total: String


    enum CodingKeys: String, CodingKey {
        case id
        case ID
        case IdCliente
        case IdProduct
        case NameProduct
        case Pieces
        case Subtotal
        case Total
      }
}
