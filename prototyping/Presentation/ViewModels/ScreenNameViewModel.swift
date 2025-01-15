import Foundation

@MainActor
class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    private let fetchPopularMovies: FetchPopularMovies

    init(fetchPopularMovies: FetchPopularMovies) {
        self.fetchPopularMovies = fetchPopularMovies
    }

    func loadMovies() async {
        do {
            let movies = try await fetchPopularMovies.execute()
            
            // Debugging log to check the fetched movies count
            print("Fetched \(movies.count) movies: \(movies.map { $0.title })")
            
            self.movies = movies
            print("Movies successfully updated in ViewModel. Total: \(self.movies.count)")
        } catch {
            print("Failed to load movies: \(error)")
        }
    }
}
