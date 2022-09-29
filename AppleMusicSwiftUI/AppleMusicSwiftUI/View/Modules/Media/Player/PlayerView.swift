import SwiftUI

struct PlayerView: View {
    @Binding var curentPlaySong: CurentPlaySong
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack{
            Image(curentPlaySong.info.nameImage)
                .resizable()
                .frame(
                    width: UIScreen.main.bounds.width,
                    height: UIScreen.main.bounds.height,
                    alignment: .center
                )
                .scaleEffect(1.4)
                .blur(radius:  Metrics.blurRadius)
            
            ZStack{
                VStack{
                    Image(curentPlaySong.info.nameImage)
                        .resizable()
                        .cornerRadius(20)
                        .frame(
                            width: UIScreen.main.bounds.width / 1.5,
                            height: UIScreen.main.bounds.width / 1.5,
                            alignment: .center
                        )
                        .padding(.bottom, UIScreen.main.bounds.height / 10)
                    HStack{
                        VStack(alignment: .leading) {
                            Text(curentPlaySong.info.artistName)
                                .bold()
                            Text(curentPlaySong.info.songName)
                        }
                        Spacer()
                        Button {} label: {
                            Image(systemName: "ellipsis.circle.fill")
                                .foregroundColor(.secondary)
                                .shadow(radius: 20)
                        }
                    }
                    .font(.title2)
                    
                    Slider(value: $curentPlaySong.currentTime, in: 0...curentPlaySong.info.timeSong)
                        .accentColor(.primary) //.opacity(Opacity.upperMin)
                        .padding(.top, 10)
                        .padding(.bottom, 5)
                    HStack {
                        Text("0:00")
                        Spacer()
                        Text("-\(convertTime(curentPlaySong.info.timeSong - curentPlaySong.currentTime))")
                    }
                    .font(.subheadline)
                    
                    HStack{
                        Button {} label: {
                            Image(systemName: "backward.fill")
                                .font(.system(size: 40))
                        }
                        Spacer()
                        Button {} label: {
                            Image(systemName: "play.fill")
                                .font(.system(size: 60))
                        }
                        Spacer()
                        Button {} label: {
                            Image(systemName: "forward.fill")
                                .font(.system(size: 40))
                        }
                    }
                    .tint(.primary)
                    .padding(30)
                    
                    HStack {
                        Image(systemName: "speaker.fill")
                            .font(.system(size: 15))
                        Slider(value: $curentPlaySong.volumeLevel, in: 0...100)
                            .blendMode(.normal)
                            .tint(.primary)
                        Image(systemName: "speaker.wave.3.fill")
                            .font(.system(size: 15))
                    }
                    HStack{
                        Button {} label: {
                            Image(systemName: "quote.bubble")
                        }
                        Spacer()
                        Button {} label: {
                            Image(systemName: "airplayaudio")
                        }
                        Spacer()
                        Button {} label: {
                            ZStack{
                                Image(systemName: "list.bullet")
                                
                                ZStack{
                                    Circle()
                                        .frame(width: 20, height: 20)
                                    
                                    Image(systemName: "shuffle")
                                        .tint(.gray)
                                        .font(.system(size: 10))
                                        .cornerRadius(10)
                                }
                                .offset(x: 12, y: -12)
                            }
                            
                        }
                    }
                    .tint(.primary)
                    .padding()
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.7)
                    .font(.system(size: 30, weight: .bold))
                }
                .padding(.trailing, 30)
                .padding(.leading, 30)
                .onTapGesture(count: 2) {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }
    }
}

extension PlayerView {
    
    enum Metrics {
        static let blurRadius: CGFloat = 100
    }
    
    func convertTime(_ time: Double) -> String {
        let minute = Int(time / 60) % 60
        let second = Int(time) % 60
        return String(format: "%02i:%02i", minute, second)
    }
}
