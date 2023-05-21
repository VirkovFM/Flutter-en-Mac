import Foundation
import FirebaseFirestoreSwift

struct Sale: Identifiable, Codable {
    @DocumentID var id: String?
    var ID: String
    var Name: String
    var Amount: String
    var IdSale: String
    var IdBuy: String
    var Pieces: String
    var Subtotal: String
    var Total: String


    enum CodingKeys: String, CodingKey {
        case id
        case ID
        case Name
        case Amount
        case IdSale
        case IdBuy
        case Pieces
        case Subtotal
        case Total
      }
}
