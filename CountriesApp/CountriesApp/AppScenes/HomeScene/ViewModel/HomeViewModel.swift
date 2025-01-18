
import Foundation

@MainActor
final class HomeViewModel: ObservableObject {
    //MARK: - Variables -
    @Published var searchText = ""
    @Published var countries: [Country] = []
    @Published var isLoading = false
    @Published var error: Error?
    
    private let service = NetworkService()
    private let dateFormatter: DateFormatter
    
    //MARK: - Initialization -
    
    init() {
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
    }
    
    //MARK: - Getters -
    
    var filteredCountries: [Country] {
        if searchText.isEmpty {
            return countries
        } else {
            return countries.filter { country in
                country.name.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    func fetchCountries() async {
        isLoading = true
        error = nil
        do {
            countries = try await service.fetchCountries()
        } catch {
            self.error = error
        }
        isLoading = false
    }
    
    //MARK: - Helpers -
    
    private func formatDateString(_ dateString: String?) -> String {
        if let dateString = dateString, let date = ISO8601DateFormatter().date(from: dateString) {
            return date.formatted(forDisplayWith: dateFormatter)
        } else {
            let randomDate = generateRandomDateWithinLastTwoYears()
            return randomDate.formatted(forDisplayWith: dateFormatter)
        }
    }
    
     func generateRandomDateWithinLastTwoYears() -> Date {
        let currentDate = Date()
        let calendar = Calendar.current
        let twoYearsAgo = calendar.date(byAdding: .year, value: -2, to: currentDate)!
        let randomTimeInterval = TimeInterval.random(in: twoYearsAgo.timeIntervalSinceNow...currentDate.timeIntervalSinceNow)
        return Date(timeIntervalSinceNow: randomTimeInterval)
    }
}
