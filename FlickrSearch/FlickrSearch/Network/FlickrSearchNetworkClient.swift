import Foundation

protocol FlickrSearchNetworkClientProtocol {
    func requestData<T: Decodable>(request: FlickrSearchClientProtocol, decodeToType: T.Type, domain: FlickrSearchApi) async throws -> T
}

final class FlickrSearchNetworkClient: FlickrSearchNetworkClientProtocol {
    private let urlSession: URLSession

    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }

    func requestData<T>(request: FlickrSearchClientProtocol, decodeToType: T.Type, domain: FlickrSearchApi) async throws -> T where T : Decodable {
        let urlRequest = try self.urlRequest(from: request, with: domain)
        let (data, response) = try await self.urlSession.data(for: urlRequest)
        let verifiedData = try verifyResponse(data: data, response: response)
        return try JSONDecoder().decode(T.self, from: verifiedData)
    }

    private func urlRequest(from request: FlickrSearchClientProtocol, with domain: FlickrSearchApi) throws -> URLRequest {
        guard let url = createURL(for: request, with: domain) else {
            throw URLError(.badURL)
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.allHTTPHeaderFields = request.headers

        urlRequest.httpBody = request.body

        return urlRequest
    }

    private func createURL(for request: FlickrSearchClientProtocol, with domain: FlickrSearchApi) -> URL? {
        var components = URLComponents(string: domain.rawValue + request.endpoint)

        let parameters = request.parameters
        components?.queryItems = parameters.map { key, value in
            URLQueryItem(name: key, value: String(describing: value))
        }

        return components?.url
    }

    private func verifyResponse(data: Data, response: URLResponse) throws -> Data {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw FlickrSearchApiError.unknown("Could not cast to HTTPURLResponse object.")
        }

        switch httpResponse.statusCode {
        case 200...299:
            return data
        case 403:
            throw FlickrSearchApiError.authenticationRequired
        case 404:
            throw FlickrSearchApiError.couldNotFindHost
        case 500:
            throw FlickrSearchApiError.badRequest
        default: throw FlickrSearchApiError.unknown("Internal error!")
        }
    }
}
