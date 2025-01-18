

import XCTest
@testable import CountriesApp

final class CountriesAppTests: XCTestCase {

    func testFetchCountries() async throws {
        let service = NetworkService()
        let countries = try await service.fetchCountries()
        
        XCTAssertFalse(countries.isEmpty, "countries should not be empty")
        XCTAssertNotNil(countries.first?.name, "country name should not be nil")
    }
    
    func testRecentDateFormatting() {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE, MMM d, yyyy"
            
            let calendar = Calendar.current
            let recentDate = calendar.date(byAdding: .month, value: -2, to: Date())!
            
            let formattedDate = recentDate.formatted(forDisplayWith: formatter)
            
            XCTAssertEqual(formattedDate, formatter.string(from: recentDate), "Recent date should be formatted as full date")
        }
}
