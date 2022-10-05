//
//  SearchCell.swift
//  AppleMusicSwiftUI
//
//  Created by Panda on 29.09.2022.
//

import SwiftUI

struct SearchCell: View {
    @Binding var curentPlaySong: CurentPlaySong
    var song: SongData
    
    var body: some View {
        HStack {
            Image(song.nameImage)
                .resizable()
                .frame(width: 70, height: 70, alignment: .center)
                .padding(.trailing, 20)
            
            VStack(alignment: .leading) {
                Text(song.songName)
                    .bold()
                Text(song.artistName)
            }
        }
        .onTapGesture(count: 2) {
            curentPlaySong.info = song
            curentPlaySong.currentTime = 0.0
        }
        .tint(.primary)
        .padding(.top, 10)
        .padding(.leading, 20)
    }
}
