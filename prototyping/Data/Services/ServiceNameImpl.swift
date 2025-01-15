class MovieServiceImpl: MovieService {
    private let apiClient: APIClient

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    func getPopularMovies() async throws -> [MovieDTO] {
        let url = "\(Config.baseURL)/movie/popular?api_key=\(Config.apiKey)"
        return try await apiClient.fetch(url: url, responseType: [MovieDTO].self)
    }
}
