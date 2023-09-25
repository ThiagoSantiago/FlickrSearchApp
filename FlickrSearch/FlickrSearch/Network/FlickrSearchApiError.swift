import Foundation

enum FlickrSearchApiError: Error {
    case badUrl
    case authenticationRequired
    case brokenData
    case couldNotFindHost
    case couldNotParseObject
    case badRequest
    case unknown(String)

    var localizedDescription: String {
        switch self {
        case .badUrl: return L10n.FlickrSearchApiError.badUrl
        case .authenticationRequired: return L10n.FlickrSearchApiError.authenticationRequired
        case .brokenData: return L10n.FlickrSearchApiError.brokenData
        case .couldNotFindHost: return L10n.FlickrSearchApiError.couldNotFindHost
        case .badRequest: return L10n.FlickrSearchApiError.badRequest
        case .couldNotParseObject: return L10n.FlickrSearchApiError.couldNotParseObject
        case let .unknown(message): return message
        }
    }
}

extension FlickrSearchApiError: Equatable {
    static func == (lhs: FlickrSearchApiError, rhs: FlickrSearchApiError) -> Bool {
        return lhs.localizedDescription == rhs.localizedDescription
    }
}
