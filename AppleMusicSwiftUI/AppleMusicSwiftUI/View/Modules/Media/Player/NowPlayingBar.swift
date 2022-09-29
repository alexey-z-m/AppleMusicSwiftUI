import SwiftUI

struct CurentPlaySong {
    var info = SongData.getSongs().first!
    var currentTime = 10.0
    var volumeLevel = 10.0
}

struct NowPlayingBar: View {
    @State var play = false
    @Binding var playerClicked: Bool
    @Binding var curentPlaySong: CurentPlaySong
    
    var body: some View {
        ZStack() {
            Rectangle()
                .frame(width: UIScreen.main.bounds.size.width, height: 90)
                .foregroundColor(Color.white.opacity(0.0))
                .background(.ultraThinMaterial).opacity(0.9)
            
            HStack {
                HStack {
                    Image(curentPlaySong.info.nameImage)
                        .resizable()
                        .frame(width: 60, height: 60)
                        .shadow(radius: 6)
                        .padding(.leading, 20)
                    
                    Text("\(curentPlaySong.info.artistName) - \(curentPlaySong.info.songName)")
                        .font(.headline)
                        .lineLimit(1)
                        .padding(.leading, 20)
                    Spacer()
                }
                .onTapGesture(count: 2, perform: {
                    playerClicked.toggle()
                })
                .fullScreenCover(
                    isPresented: $playerClicked) {
                        PlayerView(curentPlaySong: $curentPlaySong)
                    }
                
                Button{
                    play.toggle()
                } label: {
                    if play {
                        Image(systemName: "pause.fill")
                            .font(.title3)
                    } else {
                        Image(systemName: "play.fill")
                            .font(.title3)
                    }
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal)
                
                Button {} label: {
                    Image(systemName: "forward.fill").font(.title3)
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.trailing, 30)
            }
        }
    }
}
