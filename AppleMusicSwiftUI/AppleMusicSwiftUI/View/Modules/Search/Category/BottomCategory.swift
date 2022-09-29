//
//  BottomCategoty.swift
//  AppleMusicSwiftUI
//
//  Created by Panda on 22.09.2022.
//

import SwiftUI

struct BottomCategory: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem()]) {
                ForEach(CategoryData.categoryData) { item in
                    BottomCategoryButton(
                        name: item.name,
                        nameImage: item.nameImage
                    )
                }
            }
            .padding()
        }
    }
}

struct BottomCategory_Previews: PreviewProvider {
    static var previews: some View {
        BottomCategory()
    }
}
