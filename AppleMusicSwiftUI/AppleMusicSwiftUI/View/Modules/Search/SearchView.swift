import SwiftUI

struct SearchView: View {
    @Binding var curentPlaySong: CurentPlaySong
    @State var songs = SongData.getSongs()
    @State var searchText = ""
    @State var isSearching = false
    var body: some View {
        NavigationView {
            ScrollView{
                LazyVStack(alignment: .leading) {
                    if searchText.isEmpty {
                        Text("Поиск по категориям")
                            .bold()
                            .font(.title2)
                            .padding(.leading)
                        LazyVGrid(columns: [GridItem(),GridItem()]) {
                            ForEach(CategoryData.categoryData) { item in
                                SearchCategoryButton(
                                    nameImage: item.nameImage,
                                    name: item.name
                                )
                            }
                        }
                        .padding()
                    } else {
                        ForEach(songs.filter { song in
                            searchText == "" ? true :
                            song.songName.lowercased().contains(searchText.lowercased())
                        }) { song in
                            SearchCell(curentPlaySong: $curentPlaySong, song: song)
                        }
                    }
                }
                .navigationTitle("Поиск")
            }
            .searchable(text: $searchText, prompt: "Ваша медиатека") {
                ForEach(songs.filter { song in
                    searchText == "" ? true :
                    song.songName.lowercased().contains(searchText.lowercased())
                }) { song in
                    Text(song.songName)
                        .searchCompletion(song.songName)
                }
            }
        }
    }
}
