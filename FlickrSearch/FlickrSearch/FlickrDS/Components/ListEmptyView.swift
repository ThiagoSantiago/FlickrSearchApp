import SwiftUI

struct ListEmptyView: View {
    var title: String
    var description: String

    var body: some View {
        VStack {
            Asset.Images.emptyIlustration.swiftUIImage
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 250)
            TextView(text: title,
                     font: .titleBoldH3,
                     color: .titleColor)
            .padding([.bottom, .horizontal])

            TextView(text: description,
                     font: .regularBody,
                     color: .titleColor)
            .padding()
        }
    }
}

#Preview {
    ListEmptyView(title: "Nothing here",
              description: "How about looking for something interesting?")
}
