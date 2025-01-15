import SwiftUI

struct MovieListView: View {
    @StateObject private var viewModel: MovieListViewModel

    init(viewModel: MovieListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationView {
            List(viewModel.movies, id: \.id) { movie in
                VStack(alignment: .leading) {
                    Text(movie.title)
                        .font(.headline)
                    Text(movie.releaseDate)
                        .font(.subheadline)
                }
            }
            .navigationTitle("Data (\(viewModel.movies.count))")
            .task {
                await viewModel.loadMovies()
            }
        }
        .onChange(of: viewModel.movies.count) { newCount in
            // Force SwiftUI to update the navigation title when the count changes
            print("Data count updated: \(newCount)")
        }
    }
}
