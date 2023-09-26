import SwiftUI
import UIKit

@MainActor
final class FlickrSearchImageCoordinator {
    private(set) var rootNavigationController: UINavigationController?
    private weak var sceneDelegate: SceneDelegate?

    init(sceneDelegate: SceneDelegate) {
        self.sceneDelegate = sceneDelegate
        self.rootNavigationController = FlickrSearchImageCoordinator().rootNavigationController
    }

    init() {
        start()
    }

    private func start() {
        let viewModel = FlickrSearchImageViewModel(repository: FlickrSearchImageRepository(), navigator: self)
        let view = FlickrSearchImageView(viewModel: viewModel)
        let hostingController = FlickrSearchImageHostingController(rootView: view)
        let navigationController = UINavigationController(rootViewController: hostingController)
        self.rootNavigationController = navigationController
    }
}

extension FlickrSearchImageCoordinator: FlickrSearchImageNavigator {
    func navigatToImageDetails(_ image: SearchedImageDomainModel) {
        let viewModel = FlickrDetailImageViewModel(imageItem: image)
        let view = FlickrDetailImageView(viewModel: viewModel)
        let hostingController = FlickrDetailImageHostingController(rootView: view)
        self.rootNavigationController?.pushViewController(hostingController, animated: true)

    }
}
