
import Foundation

class NetworkService {
    private let url = URL(string: "https://restcountries.com/v2/all")!
    
    func fetchCountries() async throws -> [Country] {
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode([Country].self, from: data)
    }
}
