import Foundation

// sourcery: AutoMockable
enum FlickrSearchImageRequest: FlickrSearchClientProtocol {
    case searchImage(_ text: String)

    var endpoint: String {
        switch self {
        case .searchImage:
            return "services/feeds/photos_public.gne"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .searchImage:
            return .get
        }
    }

    var parameters: [String : String] {
        switch self {
        case let .searchImage(text):
            return [
                "format": "json",
                "nojsoncallback": "1",
                "tags": text]
        }
    }

}
