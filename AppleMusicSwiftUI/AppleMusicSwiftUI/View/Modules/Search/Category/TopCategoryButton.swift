//
//  TopButton.swift
//  AppleMusicSwiftUI
//
//  Created by Panda on 22.09.2022.
//

import SwiftUI

struct TopCategoryButton: View {
    @Environment(\.colorScheme) var colorScheme
    let type: String
    let name: String
    let discription: String
    let nameImage: String
    
    var body: some View {
        Button {} label: {
            VStack(alignment: .leading, spacing: 4) {
                Text(type)
                    .foregroundColor(.secondary)
                    .font(.headline)
                
                Text(name)
                    .bold()
                    .frame(minWidth: Metrics.topRadioWidth, alignment: .leading)
                    .font(.title3)
                .foregroundColor(colorScheme == .dark ? .white : .black)
                
                Text(discription)
                    .frame(minWidth: Metrics.topRadioWidth, alignment: .leading)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Image(nameImage)
                    .resizable()
                    .frame(width: Metrics.topRadioWidth, height: Metrics.topRadioHeight, alignment: .center)
                    .cornerRadius(10)
            }
        }
    }
}

struct TopCategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        TopCategoryButton(
            type: "",
            name: "",
            discription: "",
            nameImage: "image1")
    }
}

extension TopCategoryButton {
    enum Metrics {
        static let topRadioWidth = UIScreen.main.bounds.width - 50
        static var topRadioHeight = topRadioWidth / 1.74
    }
}
