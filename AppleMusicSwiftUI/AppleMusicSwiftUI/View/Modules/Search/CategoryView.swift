//
//  CategoryView.swift
//  AppleMusicSwiftUI
//
//  Created by Panda on 15.09.2022.
//

import SwiftUI

struct CategoryView: View {
    var namecategory: String
    var body: some View {
        ScrollView(.vertical) {
            TopCategory()
            
            BottomCategory()
            
            Spacer(minLength: 100)
                .navigationTitle(namecategory)
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(namecategory: "Category")
    }
}
