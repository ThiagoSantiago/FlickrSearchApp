import SwiftUI

struct TextView: View {
    private let text: String
    private let font: Font
    private let color: Color

    init(
        text: String,
        font: Font,
        color: Color
    ) {
        self.text = text
        self.font = font
        self.color = color
    }

    var body: some View {
        VStack {
            Text(text)
                .font(font)
                .lineLimit(nil)
                .frame(maxWidth: .infinity)
                .foregroundColor(color)
        }
    }
}

#Preview {
    TextView(text: "slkdfjlskfjddsjfklsjdflksjdflksjdfkljsdfkljsfdlsjdfklsjdfksljfdslkdfjslkfdjslkdfjsldkfjskldfjskldfjs", font: .title, color: .titleText)
}
