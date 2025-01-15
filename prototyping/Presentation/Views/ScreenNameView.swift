import SwiftUI

struct PopularMoviesView: View {
    @StateObject private var viewModel: PopularMoviesViewModel
    
    init(viewModel: PopularMoviesViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.movies) { movie in
                Text(movie.title)
            }
            .navigationTitle("Popular Movies")
            .task {
                await viewModel.loadMovies()
            }
        }
    }
}
