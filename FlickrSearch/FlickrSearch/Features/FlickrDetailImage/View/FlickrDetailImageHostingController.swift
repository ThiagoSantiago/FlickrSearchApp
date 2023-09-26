import SwiftUI
import UIKit

final class FlickrDetailImageHostingController: UIHostingController<FlickrDetailImageView> {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        title = "Flickr Search App"
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}
