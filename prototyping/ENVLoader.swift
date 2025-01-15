//import Foundation
//
//struct Env {
//    static func loadEnv() {
//        guard let path = Bundle.main.path(forResource: ".env", ofType: nil) else {
//            fatalError("⚠️ .env file is missing in the project directory.")
//        }
//        do {
//            let content = try String(contentsOfFile: path, encoding: .utf8)
//            content.components(separatedBy: .newlines).forEach { line in
//                let parts = line.split(separator: "=", maxSplits: 1).map { String($0) }
//                if parts.count == 2 {
//                    setenv(parts[0], parts[1], 1)
//                }
//            }
//        } catch {
//            fatalError("⚠️ Failed to read .env file: \(error.localizedDescription)")
//        }
//    }
//
//    static func get(_ key: String) -> String {
//        guard let value = ProcessInfo.processInfo.environment[key] else {
//            fatalError("⚠️ \(key) not found in environment variables.")
//        }
//        return value
//    }
//}


import Foundation

struct Env {
    static func loadEnv() {
        guard let path = Bundle.main.path(forResource: ".env", ofType: nil) else {
            fatalError("⚠️ .env file is missing in the project directory.")
        }
        do {
            let content = try String(contentsOfFile: path, encoding: .utf8)
            content.components(separatedBy: .newlines).forEach { line in
                let parts = line.split(separator: "=", maxSplits: 1).map { String($0) }
                if parts.count == 2 {
                    setenv(parts[0], parts[1], 1)
                }
            }
        } catch {
            fatalError("⚠️ Failed to read .env file: \(error.localizedDescription)")
        }
    }

    static func get(_ key: String) -> String {
        guard let value = ProcessInfo.processInfo.environment[key] else {
            fatalError("⚠️ \(key) not found in environment variables.")
        }
        return value
    }
}
