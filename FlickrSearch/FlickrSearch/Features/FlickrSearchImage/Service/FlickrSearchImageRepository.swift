import Foundation

// sourcery: AutoMockable
protocol FlickrSearchImageRepositoryProtocol {
    func searchImage(_ text: String) async throws -> [SearchedImageDomainModel]
}

final class FlickrSearchImageRepository: FlickrSearchImageRepositoryProtocol {
    private let networkClient: FlickrSearchNetworkClientProtocol

    init(networkClient: FlickrSearchNetworkClientProtocol = FlickrSearchNetworkClient()) {
        self.networkClient = networkClient
    }

    func searchImage(_ text: String) async throws -> [SearchedImageDomainModel] {
        let request = FlickrSearchImageRequest.searchImage(text)
        let response = try await networkClient.requestData(
            request: request,
            decodeToType: SearchedImages.self,
            domain: .searchBaseUrl
        )
        return response.items.map {
            SearchedImageDomainModel(title: $0.title,
                                     imageUrl: $0.media.m,
                                     dateTaken: $0.dateTaken,
                                     description: $0.description,
                                     published: $0.published,
                                     author: $0.author,
                                     tags: $0.tags)
        }
    }
}
