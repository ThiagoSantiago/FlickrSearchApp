import SwiftUI
import UIKit

final class FlickrSearchImageHostingController: UIHostingController<FlickrSearchImageView> {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}
