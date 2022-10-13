//
//  TopButton.swift
//  AppleMusicSwiftUI
//
//  Created by Panda on 22.09.2022.
//

import SwiftUI

struct BottomCategoryButton: View {
    @Environment(\.colorScheme) var colorScheme
    let name: String
    let nameImage: String
    
    var body: some View {
        Button {} label: {
            VStack(alignment: .leading, spacing: 4) {
                Image(nameImage)
                    .resizable()
                    .frame(width: Metrics.topWidth, height: Metrics.topHeight, alignment: .center)
                    .cornerRadius(10)
                
                Text(name)
                    .bold()
                    .frame(minWidth: Metrics.topWidth, alignment: .leading)
                    .font(.title3)
                .foregroundColor(colorScheme == .dark ? .white : .black)
            }
        }
    }
}

struct BottomCategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        BottomCategoryButton(
            name: "123",
            nameImage: "image1")
    }
}

extension BottomCategoryButton {
    enum Metrics {
        static let topWidth = (UIScreen.main.bounds.width/2) - 20
        static var topHeight = topWidth
    }
}
