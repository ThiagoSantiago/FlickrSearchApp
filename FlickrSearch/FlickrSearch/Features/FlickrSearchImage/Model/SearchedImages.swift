import Foundation

struct SearchedImages: Decodable {
    let title: String
    let link: String
    let description: String
    let modified: String
    let generator: String
    let items: [SearchedImageItem]
}

