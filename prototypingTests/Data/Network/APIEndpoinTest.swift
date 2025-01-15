import XCTest
@testable import prototyping

final class APIEndpointsTests: XCTestCase {
    func testPopularMoviesEndpoint() {
        let expectedURL = "https://api.themoviedb.org/3/movie/popular?api_key=YOUR_API_KEY"
        XCTAssertEqual(APIEndpoints.Movies.popular, expectedURL)
    }

    func testMovieDetailsEndpoint() {
        let movieID = 12345
        let expectedURL = "https://api.themoviedb.org/3/movie/12345?api_key=YOUR_API_KEY"
        XCTAssertEqual(APIEndpoints.Movies.details(for: movieID), expectedURL)
    }
    
    func testSearchMovieEndpoint() {
        let query = "Avengers"
        let expectedURL = "https://api.themoviedb.org/3/search/movie?query=Avengers&api_key=YOUR_API_KEY"
        XCTAssertEqual(APIEndpoints.Search.movie(query: query), expectedURL)
    }
}
