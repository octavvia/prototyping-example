//class MovieRepositoryImpl: MovieRepository {
//    private let networkService: NetworkService
//    
//    init(networkService: NetworkService) {
//        self.networkService = networkService
//    }
//    
//    func fetchPopularMovies() async throws -> [Movie] {
//        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=YOUR_API_KEY")!
//        return try await networkService.request(url: url)
//    }
//}

import Foundation


class MovieRepositoryImpl: MovieRepository {
    private let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    func fetchPopularMovies() async throws -> [Movie] {
        guard let url = URL(string: APIEndpoints.Movies.popular) else {
            throw URLError(.badURL)
        }
        return try await networkService.request(url: url)
    }
    
    func fetchMovieDetails(movieID: Int) async throws -> Movie {
        guard let url = URL(string: APIEndpoints.Movies.details(for: movieID)) else {
            throw URLError(.badURL)
        }
        return try await networkService.request(url: url)
    }
}
