import XCTest
@testable import prototyping

class MovieRepositoryImplTests: XCTestCase {
    func testFetchPopularMovies_ReturnsMovies() async throws {
        let mockService = MockNetworkService()
        let repository = MovieRepositoryImpl(networkService: mockService)
        
        let movies = try await repository.fetchPopularMovies()
        XCTAssertEqual(movies.first?.title, "Mock Movie")
    }
}

class MockNetworkService: NetworkService {
    override func request<T: Decodable>(url: URL?) async throws -> T {
        guard let _ = url else {
            throw URLError(.badURL)
        }
        return [Movie(id: 1, title: "Mock Movie", overview: "Mock Overview", releaseDate: "2023-01-01")] as! T
    }
}
