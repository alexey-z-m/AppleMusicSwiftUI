import SwiftUI

struct LibraryData: Identifiable {
    let name: String
    let nameImage: String
    var id: String { name }
}

extension LibraryData {
    static var libraryData: [LibraryData] = [
        LibraryData(name: "Плейлисты", nameImage: "music.note.list"),
        LibraryData(name: "Артисты", nameImage: "music.mic"),
        LibraryData(name: "Альбомы", nameImage: "square.stack"),
        LibraryData(name: "Песни", nameImage: "music.note"),
        LibraryData(name: "Телешоу и фильмы", nameImage: "tv"),
        LibraryData(name: "Видеоклипы", nameImage: "music.note.tv"),
        LibraryData(name: "Жанры", nameImage: "guitars"),
        LibraryData(name: "Сборники", nameImage: "person.2.crop.square.stack"),
        LibraryData(name: "Авторы", nameImage: "music.quarternote.3"),
        LibraryData(name: "Загружено", nameImage: "arrow.down.circle"),
        LibraryData(name: "Домашняя коллекция", nameImage: "music.note.house")]
}
