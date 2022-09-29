//
//  TopCategory.swift
//  AppleMusicSwiftUI
//
//  Created by Panda on 22.09.2022.
//

import SwiftUI

struct TopCategory: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem()]) {
                ForEach(RadioData.radioData) { item in
                    TopCategoryButton(
                        type: item.type,
                        name: item.name,
                        discription: item.discription,
                        nameImage: item.nameImage
                    )
                }
            }
            .padding()
        }
    }
}

struct TopCategory_Previews: PreviewProvider {
    static var previews: some View {
        TopCategory()
    }
}
