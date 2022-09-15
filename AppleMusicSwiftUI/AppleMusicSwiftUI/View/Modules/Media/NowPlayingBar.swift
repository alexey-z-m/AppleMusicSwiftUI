import SwiftUI

struct NowPlayingBar: View {
    @State var play = false
    
    var body: some View {
        ZStack() {
            Rectangle()
                .frame(width: UIScreen.main.bounds.size.width, height: 90)
                .foregroundColor(Color.white.opacity(0.0))
                .background(.ultraThinMaterial).opacity(0.6)
            HStack {
                Button(action: {}) {
                    HStack {
                        Image(systemName: "person")
                            .resizable()
                            .frame(width: 45, height: 45)
                            .shadow(radius: 6)
                            .padding(.leading, 20)
                        Text("Some artist")
                            .font(.headline)
                            .padding(.leading, 20)
                        Spacer()
                    }
                }
                .buttonStyle(PlainButtonStyle())
                Button(action: {
                    play.toggle()
                    
                }) {
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
                Button(action: {}) {
                    Image(systemName: "forward.fill").font(.title3)
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.trailing, 30)
            }
        }
    }
}

struct NowPlayingBar_Previews: PreviewProvider {
    static var previews: some View {
        NowPlayingBar()
    }
}
