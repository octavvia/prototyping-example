class MovieRepositoryImpl: MovieRepository {
    private let service: MovieService

    init(service: MovieService) {
        self.service = service
    }

    func fetchPopularMovies() async throws -> [Movie] {
        let dtos = try await service.getPopularMovies()
        return dtos.map { Movie(id: $0.id, title: $0.title, releaseDate: $0.releaseDate, voteAverage: $0.voteAverage) }
    }
}
