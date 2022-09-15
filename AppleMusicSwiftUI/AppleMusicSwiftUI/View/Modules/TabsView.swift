import SwiftUI

struct TabsView: View {
    
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
                SearchView()
                    .tabItem {
                        Text(Strings.search)
                        Image(systemName: "magnifyingglass")
                    }
            }
            .accentColor(.red)
            
            NowPlayingBar().padding(.bottom, 50)
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
