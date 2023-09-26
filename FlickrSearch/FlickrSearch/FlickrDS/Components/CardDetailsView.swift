import SwiftUI

struct CardDetailsModel {
    var id: UUID { UUID()}
    let key: String
    let value: String
}

struct CardDetailsView: View {
    var details: [CardDetailsModel]

    var body: some View {
        VStack {
            VStack(spacing: 12) {
                ForEach(details, id: \.id) { item in
                    HStack {
                        TextView(text: item.key,
                                 font: .regularBodyBold,
                                 color: .titleColor)

                        TextView(text: item.value,
                                 font: .regularBody,
                                 color: .titleColor)
                        .lineLimit(nil)
                    }
                }
            }
            .padding()
        }
        .border(Color.fieldBackgroundColor, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
        .shadow(radius: 1)
        .padding()
    }
}
