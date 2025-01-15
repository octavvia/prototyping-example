////
////  prototypingApp.swift
////  prototyping
////
////  Created by octavia octavia on 14/01/25.
////
//
//import SwiftUI
//import SwiftData
//
//@main
//struct prototypingApp: App {
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Item.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()
//
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//        .modelContainer(sharedModelContainer)
//    }
//}


//import SwiftUI
//
//@main
//struct PrototypingApp: App {
//    init() {
//        Env.loadEnv() // Load environment variables at startup
//    }
//
//    var body: some Scene {
//        WindowGroup {
//            ContentView()
//        }
//    }
//}


import SwiftUI

@main
struct PrototypingApp: App {
    init() {
        Env.loadEnv() // Load environment variables at startup
    }

    var body: some Scene {
        WindowGroup {
            // Provide a ViewModel instance here
            PopularMoviesView(viewModel: PopularMoviesViewModel(fetchPopularMoviesUseCase: makeFetchPopularMoviesUseCase()))
        }
    }

    private func makeFetchPopularMoviesUseCase() -> FetchPopularMoviesUseCase {
        let networkService = NetworkService()
        let repository = MovieRepositoryImpl(networkService: networkService)
        return FetchPopularMoviesUseCase(repository: repository)
    }
}
