import SwiftUI

struct ImageCardView: View {
    var imageUrl: String
    var placeholderImage: Image = Asset.Images.imagePlaceholder.swiftUIImage
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: imageUrl)) { image in
                image
                    .resizable()
            } placeholder: {
                placeholderImage
                    .resizable()
            }
            .scaledToFit()
            .cornerRadius(10)
        }
        .background(Color.clear)
        .shadow(radius: 2)
    }
}
