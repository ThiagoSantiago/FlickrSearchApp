import SwiftUI

final class FlickrDetailImageViewModel: ObservableObject {
    var imageItem: SearchedImageDomainModel

    init(imageItem: SearchedImageDomainModel) {
        self.imageItem = imageItem
    }

    func getDetails() -> [CardDetailsModel] {
        let imageSize = imageItem.description.extractQueryParamsSize()

        return [
            CardDetailsModel(key: "Title:", value: imageItem.title),
            CardDetailsModel(key: "Author:", value: imageItem.author),
            CardDetailsModel(key: "Width:", value: "\(imageSize.width)"),
            CardDetailsModel(key: "Height:", value: "\(imageSize.height)")
        ]
    }
}
