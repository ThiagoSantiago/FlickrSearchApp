import Foundation

enum HTTPMethod: String {
    case get = "GET"
}

// sourcery: AutoMockable
protocol FlickrSearchClientProtocol {
    var endpoint: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: String] { get }
    var headers: [String : String] { get }
}

extension FlickrSearchClientProtocol {
    var headers: [String : String] {
        return [:]
    }

    var parameters: [String : String] {
        return [:]
    }

    var body: Data? { nil }
}
