import SwiftUI

struct FlickrDetailImageView: View {
    @ObservedObject private var viewModel: FlickrDetailImageViewModel

    init(
        viewModel: FlickrDetailImageViewModel
    ) {
        self.viewModel = viewModel
    }

    var body: some View {
        ScrollView {
            VStack {
                ImageCardView(imageUrl: viewModel.imageItem.imageUrl)
                    .padding()
                CardDetailsView(details: viewModel.getDetails())
                tagsSection
            }
        }
    }

    var tagsSection: some View {
        VStack {
            TextView(text: "Tags:", 
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

#Preview {
    FlickrDetailImageView(viewModel: FlickrDetailImageViewModel(imageItem: SearchedImageDomainModel(title: "Test", imageUrl: "", dateTaken: "", description: "", published: "", author: "", tags: "")))
}
