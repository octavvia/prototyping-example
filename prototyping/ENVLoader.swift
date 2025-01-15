//import SwiftDotenv
//
//struct Env {
//    static func loadEnv(at path: String = ".env", overwrite: Bool = true) {
//        do {
//            // Memuat file .env
//            try Dotenv.configure(atPath: path, overwrite: overwrite)
//            print("✅ .env file successfully loaded from path: \(path)")
//        } catch {
//            fatalError("⚠️ Failed to load .env file: \(error.localizedDescription)")
//        }
//    }
//
//    static func get(_ key: String) -> String {
//        // Mendapatkan nilai dari Dotenv dan mengonversi menjadi String
//        if let value = Dotenv[key]?.stringValue {
//            return value
//        } else {
//            fatalError("⚠️ Key '\(key)' not found in environment variables or value is not a string.")
//        }
//    }
//}
