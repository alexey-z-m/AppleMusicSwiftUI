import SwiftUI

struct SongData: Identifiable {
    let artistName: String
    let songName: String
    let nameImage: String
    let timeSong: Double
    var id: String { artistName + songName }
}

extension SongData {
    static func getSongs() -> [SongData] {
        return [
            SongData(artistName: "Linkin Park", songName: "In The End", nameImage: "LP", timeSong: 285.0),
            SongData(artistName: "Исполнитель 1", songName: "Песня 2", nameImage: "image2", timeSong: 285.0),
            SongData(artistName: "Исполнитель 1", songName: "Песня 3", nameImage: "image3", timeSong: 285.0),
            SongData(artistName: "Исполнитель 1", songName: "Песня 4", nameImage: "image4", timeSong: 285.0),
            SongData(artistName: "Исполнитель 2", songName: "Песня 5", nameImage: "image5", timeSong: 285.0),
            SongData(artistName: "Исполнитель 2", songName: "Песня 6", nameImage: "image6", timeSong: 285.0),
            SongData(artistName: "Исполнитель 2", songName: "Песня 7", nameImage: "image7", timeSong: 285.0),
            SongData(artistName: "Исполнитель 2", songName: "Песня 8", nameImage: "image8", timeSong: 285.0),
            SongData(artistName: "Исполнитель 3", songName: "Песня 9", nameImage: "image9", timeSong: 285.0)
        ]
    }
}
