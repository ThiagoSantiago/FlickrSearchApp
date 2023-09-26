import SwiftUI

extension Font {
    static let titleH1: Font = .custom("Georgia", size: 44, relativeTo: .headline).weight(.heavy)
    static let titleBoldH3: Font = .custom("Georgia", size: 28, relativeTo: .title2).bold()
    static let regularBody: Font = .custom("Georgia", size: 16, relativeTo: .body)
}
