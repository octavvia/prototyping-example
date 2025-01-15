struct FetchPopularMoviesUseCase {
    private let repository: MovieRepository
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    func execute() async throws -> [Movie] {
        return try await repository.fetchPopularMovies()
    }
}
