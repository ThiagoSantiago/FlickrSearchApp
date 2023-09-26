import Foundation

struct SearchedImageDomainModel: Decodable, Identifiable {
    var id: UUID { UUID() }
    let title: String
    let imageUrl: String
    let dateTaken: String
    let description: String
    let published: String
    let author: String
    let tags: String
}
