import Foundation

class APIClient {
    func fetch<T: Decodable>(url: String, responseType: T.Type) async throws -> T {
        guard let url = URL(string: url) else {
            throw URLError(.badURL)
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        return try JSONDecoder().decode(T.self, from: data)
    }
}
