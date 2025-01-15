protocol MovieService {
    func getPopularMovies() async throws -> [MovieDTO]
}
