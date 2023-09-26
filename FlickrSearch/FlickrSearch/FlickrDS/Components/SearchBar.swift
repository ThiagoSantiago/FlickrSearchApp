import SwiftUI

struct SearchBar: View {
    typealias Strings = L10n.FlickrAppCommonTexts
    @Binding var text: String
    @FocusState var isEditing: Bool
    var cancelButtonAction: () -> Void
    var body: some View {
        HStack {
            TextField(Strings.search, text: $text)
                .padding(8)
                .padding(.horizontal, 24)
                .background(Color(.systemGray4))
                .cornerRadius(8)
                .focused($isEditing)
                .overlay {
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(Color.fieldTextColor)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                    }
                }
                .onTapGesture {
                    isEditing = true
                }

            if isEditing {
                Button {
                    isEditing = false
                    text = ""
                    self.cancelButtonAction()
                } label: {
                    Text(Strings.cancel)
                        .foregroundColor(.black )
                }
                .padding(.trailing, 8)
                .transition(.move(edge: .trailing))
                .animation(.easeInOut)
            }
        }
    }
}
