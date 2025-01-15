import SwiftUI

@MainActor
class PopularMoviesViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    
    private let fetchPopularMoviesUseCase: FetchPopularMoviesUseCase
    
    init(fetchPopularMoviesUseCase: FetchPopularMoviesUseCase) {
        self.fetchPopularMoviesUseCase = fetchPopularMoviesUseCase
    }
    
    func loadMovies() async {
        do {
            movies = try await fetchPopularMoviesUseCase.execute()
        } catch {
            print("Error fetching movies: \(error)")
        }
    }
}
