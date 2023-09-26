import SwiftUI

final class FlickrDetailImageViewModel: ObservableObject {
    typealias Strings = L10n.FlickrDetailImageView
    var imageItem: SearchedImageDomainModel

    init(imageItem: SearchedImageDomainModel) {
        self.imageItem = imageItem
    }

    func getDetails() -> [CardDetailsModel] {
        let imageSize = imageItem.description.extractQueryParamsSize()

        return [
            CardDetailsModel(key: Strings.ImageDetails.title, value: imageItem.title),
            CardDetailsModel(key: Strings.ImageDetails.author, value: imageItem.author),
            CardDetailsModel(key: Strings.ImageDetails.width, value: "\(imageSize.width)"),
            CardDetailsModel(key: Strings.ImageDetails.height, value: "\(imageSize.height)")
        ]
    }
}
