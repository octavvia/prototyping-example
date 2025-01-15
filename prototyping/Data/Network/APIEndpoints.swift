//import Foundation
//
//struct APIEndpoints {
//    static let baseURL = "https://api.themoviedb.org/3"
//    static let apiKey = "YOUR_API_KEY"
//
//    enum Movies {
//        static var popular: String {
//            "\(APIEndpoints.baseURL)/movie/popular?api_key=\(APIEndpoints.apiKey)"
//        }
//        
//        static func details(for movieID: Int) -> String {
//            "\(APIEndpoints.baseURL)/movie/\(movieID)?api_key=\(APIEndpoints.apiKey)"
//        }
//    }
//    
//    enum Search {
//        static func movie(query: String) -> String {
//            "\(APIEndpoints.baseURL)/search/movie?query=\(query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")&api_key=\(APIEndpoints.apiKey)"
//        }
//    }
//}


import Foundation

struct APIEndpoints {
    static let baseURL = "https://api.themoviedb.org/3"
    static let apiKey = Env.get("API_KEY") // Load API key from .env

    enum Movies {
        static var popular: String {
            "\(APIEndpoints.baseURL)/movie/popular?api_key=\(APIEndpoints.apiKey)"
        }
        
        static func details(for movieID: Int) -> String {
            "\(APIEndpoints.baseURL)/movie/\(movieID)?api_key=\(APIEndpoints.apiKey)"
        }
    }
    
    enum Search {
        static func movie(query: String) -> String {
            "\(APIEndpoints.baseURL)/search/movie?query=\(query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")&api_key=\(APIEndpoints.apiKey)"
        }
    }
}
