import Foundation

extension String {
    func extractQueryParamsSize() -> CGSize {
        let str = self.replacingOccurrences(of: "\"", with: String(), options: .regularExpression, range: nil)

        var query = String()
        var strHeight = String()
        var strWidth = String()

        for char in str {
            let str = String(char)
            if str == " " {
                query.removeAll()
                continue
            }

            if query == "width=" {
                strWidth += str
            } else if query == "height=" {
                strHeight += str
            } else {
                query.append(str)
            }
        }

        if let height = Int(strHeight), let width = Int(strWidth) {
            let finalWidth = CGFloat(integerLiteral: width)
            let finalHeight = CGFloat(integerLiteral: height)
            return CGSize(width: finalWidth, height: finalHeight)
        }

        return CGSize(width: 0, height: 0)
    }
}
