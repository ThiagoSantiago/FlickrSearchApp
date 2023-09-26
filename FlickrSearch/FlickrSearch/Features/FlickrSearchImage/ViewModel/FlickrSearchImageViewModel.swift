import SwiftUI

// sourcery: AutoMockable
protocol FlickrSearchImageNavigator {
    func navigatToImageDetails(_ image: SearchedImageDomainModel)
}

@MainActor
final class FlickrSearchImageViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var searchedList: [SearchedImageDomainModel] = []
    private var currentTask: Task<Void, Never>?

    let repository: FlickrSearchImageRepositoryProtocol
    let navigator: FlickrSearchImageNavigator?

    init(
        repository: FlickrSearchImageRepositoryProtocol,
        navigator: FlickrSearchImageNavigator?
    ) {
        self.repository = repository
        self.navigator = navigator
    }

    func searchImages(_ text: String) async {
        isLoading = true
        currentTask?.cancel()
        print("#### current task canceled: \(currentTask?.isCancelled)")
        if text.isEmpty {
            searchedList = []
        } else {
            currentTask = Task {
                do {
                    searchedList = try await repository.searchImage(text)
                    isLoading = false
                } catch {
                    //TODO: present error
                    isLoading = false
                }
            }
        }
    }

    func searchCanceled() {
        searchedList = []
    }

    func goToImageDetails(_ image: SearchedImageDomainModel) {
        navigator?.navigatToImageDetails(image)
    }
}
