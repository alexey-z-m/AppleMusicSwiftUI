import SwiftUI

struct SongData: Identifiable {
    let name: String
    let nameImage: String
    var id: String { name }
}

extension SongData {
    static let songData: [SongData] = [
        SongData(name: "Песня 1", nameImage: "image1"),
        SongData(name: "Песня 2", nameImage: "image2"),
        SongData(name: "Песня 3", nameImage: "image3"),
        SongData(name: "Песня 4", nameImage: "image4"),
        SongData(name: "Песня 5", nameImage: "image5"),
        SongData(name: "Песня 6", nameImage: "image6"),
        SongData(name: "Песня 7", nameImage: "image7"),
        SongData(name: "Песня 8", nameImage: "image8"),
        SongData(name: "Песня 9", nameImage: "image9")]
}
