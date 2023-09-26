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
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100)
            .cornerRadius(10)
        }
        .background(
            Color.clear
                .shadow(color: Color.accentColor, radius: 10, x: 0, y: 0)
                .mask(Rectangle().padding(.bottom, -1))
        )
    }
}

#Preview {
    ImageCardView(imageUrl: "", placeholderImage: Asset.Images.imagePlaceholder.swiftUIImage)
}
