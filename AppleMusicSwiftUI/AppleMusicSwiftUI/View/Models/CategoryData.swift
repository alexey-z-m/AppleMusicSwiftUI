import SwiftUI

struct CategoryData: Identifiable {
    let name: String
    let nameImage: String
    var id: String { name }
}

extension CategoryData {
    static let categoryData: [CategoryData] = [
        CategoryData(name: "Категория 1", nameImage: "image1"),
        CategoryData(name: "Категория 2", nameImage: "image2"),
        CategoryData(name: "Категория 3", nameImage: "image3"),
        CategoryData(name: "Категория 4", nameImage: "image4"),
        CategoryData(name: "Категория 5", nameImage: "image5"),
        CategoryData(name: "Категория 6", nameImage: "image6"),
        CategoryData(name: "Категория 7", nameImage: "image7"),
        CategoryData(name: "Категория 8", nameImage: "image8"),
        CategoryData(name: "Категория 9", nameImage: "image9")]
}
