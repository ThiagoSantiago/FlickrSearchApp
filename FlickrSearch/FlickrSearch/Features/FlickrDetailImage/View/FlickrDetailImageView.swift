import SwiftUI

struct FlickrDetailImageView: View {
    typealias Strings = L10n.FlickrDetailImageView
    @ObservedObject private var viewModel: FlickrDetailImageViewModel

    init(
        viewModel: FlickrDetailImageViewModel
    ) {
        self.viewModel = viewModel
    }

    var body: some View {
        ScrollView {
            VStack {
                let imageSize = viewModel.imageItem.description.extractQueryParamsSize()
                ImageCardView(imageUrl: viewModel.imageItem.imageUrl)
                    .frame(width: imageSize.width, height: imageSize.height)
                    .padding()
                CardDetailsView(details: viewModel.getDetails())
                tagsSection
            }
        }
    }

    var tagsSection: some View {
        VStack {
            TextView(text: Strings.ImageDetails.tags,
                     font: .titleBoldH3,
                     color: .titleColor)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(viewModel.imageItem.tags.components(separatedBy: " "), id: \.self) { tag in
                        TagView(title: tag)
                    }
                }
            }
            .padding()
        }
    }
}
