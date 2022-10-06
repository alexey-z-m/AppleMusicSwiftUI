import SwiftUI

struct TabsView: View {
    @State var playerClicked = false
    @State var curentPlaySong = CurentPlaySong()
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView {
                LibraryView()
                    .tabItem {
                        Image(systemName: "rectangle.stack.fill")
                        Text(Strings.media)
                    }
                RadioView()
                    .tabItem {
                        Text(Strings.radio)
                        Image(systemName: "dot.radiowaves.left.and.right")
                    }
                // SearchView(curentPlaySong: $curentPlaySong)
                UIKitSearch()
                    .tabItem {
                        Text(Strings.search)
                        Image(systemName: "magnifyingglass")
                    }
            }
            .accentColor(.red)
            
            NowPlayingBar(
                playerClicked: $playerClicked,curentPlaySong: $curentPlaySong
            )
            .offset(y: -49)
        }
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}

extension TabsView {
    enum Strings {
        static let media = "Медиатека"
        static let radio = "Радио"
        static let search = "Поиск"
    }
}
