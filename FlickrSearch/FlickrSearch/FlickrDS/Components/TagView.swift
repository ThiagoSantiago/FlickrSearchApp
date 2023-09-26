import SwiftUI

struct TagView: View {
    var title: String

    var body: some View {
        HStack{
            TextView(text: title, 
                     font: .regularDetail,
                     color: .titleColor)
            }
            .padding()
            .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 22)
            .background(
                Capsule()
                    .strokeBorder(Color.black,lineWidth: 0.8)
                    .background(Color.gray)
                    .clipped()
            )
            .clipShape(Capsule())
    }
}
