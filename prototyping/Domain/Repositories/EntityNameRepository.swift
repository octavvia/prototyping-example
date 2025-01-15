protocol MovieRepository {
    func fetchPopularMovies() async throws -> [Movie]
}
