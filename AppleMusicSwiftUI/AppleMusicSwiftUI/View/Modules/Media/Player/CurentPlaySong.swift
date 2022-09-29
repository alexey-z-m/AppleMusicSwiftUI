//
//  CurentPlaySong.swift
//  AppleMusicSwiftUI
//
//  Created by Panda on 30.09.2022.
//

import SwiftUI

struct CurentPlaySong {
    var info = SongData.getSongs().first!
    var currentTime = 10.0
    var volumeLevel = 10.0
}
