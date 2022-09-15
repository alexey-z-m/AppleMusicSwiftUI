import SwiftUI

struct RadioData: Identifiable {
    let name: String
    let nameImage: String
    let type: String
    let discription: String
    var id: String { name }
}

extension RadioData {
    static let radioData: [RadioData] = [
        RadioData(name: "Радио 1", nameImage: "image1", type: "Новинка",    discription: "Описание1"),
        RadioData(name: "Радио 2", nameImage: "image2", type: "Эксклюзив",  discription: "Описание2"),
        RadioData(name: "Радио 3", nameImage: "image3", type: "Ретро",      discription: "Описание3"),
        RadioData(name: "Радио 4", nameImage: "image4", type: "Новинка",    discription: "Описание4"),
        RadioData(name: "Радио 5", nameImage: "image5", type: "Эксклюзив",  discription: "Описание5"),
        RadioData(name: "Радио 6", nameImage: "image6", type: "Ретро",      discription: "Описание6"),
        RadioData(name: "Радио 7", nameImage: "image7", type: "Новинка",    discription: "Описание7"),
        RadioData(name: "Радио 8", nameImage: "image8", type: "Эксклюзив",  discription: "Описание8"),
        RadioData(name: "Радио 9", nameImage: "image9", type: "Ретро",      discription: "Описание9")]
}
