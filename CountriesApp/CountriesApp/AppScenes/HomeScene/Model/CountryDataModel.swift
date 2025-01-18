
import Foundation

struct Country: Identifiable, Codable {
    let id = UUID()
    let name: String
    let flags: Flag?
    let capital: String?
    let currencies: [Currency]?
}

// Currency model
struct Currency: Codable {
    let code: String
    let name: String
    let symbol: String
}

// Flag model to represent flag URL
struct Flag: Codable {
    let svg: String
    let png: String
}
