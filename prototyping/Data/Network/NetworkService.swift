//import Foundation
////
//class NetworkService {
//    func request<T: Decodable>(url: URL) async throws -> T {
//        let (data, _) = try await URLSession.shared.data(from: url)
//        return try JSONDecoder().decode(T.self, from: data)
//    }
//}
//
//
//


import Foundation

class NetworkService {
    func request<T: Decodable>(url: URL?) async throws -> T {
        guard let url = url else {
            throw URLError(.badURL) // Ensure URL is valid
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        
        return try JSONDecoder().decode(T.self, from: data)
    }
}
