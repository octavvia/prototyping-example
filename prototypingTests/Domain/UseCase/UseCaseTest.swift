import XCTest
@testable import prototyping

final class FetchPopularMoviesUseCaseTests: XCTestCase {
    func testExecute_ReturnsMovies() async throws {
        // Arrange
        let mockRepository = MockMovieRepository()
        let useCase = FetchPopularMoviesUseCase(repository: mockRepository)
        
        // Act
        let movies = try await useCase.execute()
        
        // Assert
        XCTAssertEqual(movies.count, 2)
        XCTAssertEqual(movies.first?.title, "Mock Movie 1")
    }
}

class MockMovieRepository: MovieRepository {
    func fetchPopularMovies() async throws -> [Movie] {
        return [
            Movie(id: 1, title: "Mock Movie 1", overview: "Overview 1", releaseDate: "2023-01-01"),
            Movie(id: 2, title: "Mock Movie 2", overview: "Overview 2", releaseDate: "2023-02-01")
        ]
    }
}
