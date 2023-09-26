import XCTest
@testable import FlickrSearch

final class FlickrSearchImageViewModelTests: XCTestCase {
    private var viewModel: FlickrSearchImageViewModel!
    private let repository = FlickrSearchImageRepositoryProtocolMock()

    @MainActor func testFetch() async {
        repository.searchImageReturnValue = [SearchedImageDomainModel(title: "title",
                                                                      imageUrl: "imageUrl",
                                                                      dateTaken: "01/01/2021",
                                                                      description: "description",
                                                                      published: "01/01/2021",
                                                                      author: "author",
                                                                      tags: "tag")]
        viewModel = FlickrSearchImageViewModel(repository: repository, navigator: nil)

        await viewModel.searchImages("test")

        XCTAssertEqual(repository.searchImageReceivedText, "test")
        XCTAssertEqual(repository.searchImageCalled, true)
        XCTAssertEqual(repository.searchImageCallsCount, 1)

    }
}
