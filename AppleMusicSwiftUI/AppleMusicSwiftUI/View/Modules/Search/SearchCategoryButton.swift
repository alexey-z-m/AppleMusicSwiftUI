//
//  SearchCategoryButton.swift
//  AppleMusicSwiftUI
//
//  Created by Panda on 15.09.2022.
//

import SwiftUI

struct SearchCategoryButton: View {
    let nameImage: String
    let name: String
    
    var body: some View {
        NavigationLink {
            CategoryView(namecategory: name)
        } label: {
            ZStack(alignment: .bottomLeading){
                Image(nameImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: (UIScreen.main.bounds.width/2) - 20, height: 130, alignment: .center)
                    .cornerRadius(10)
                Text(name)
                    .padding(.leading, 20)
                    .padding(.bottom, 10)
                    .font(.headline)
                    .foregroundColor(.white)
                    .shadow(color: .black, radius: 2, x: 0, y: 0)
            }
        }
    }
}

struct SearchCategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        SearchCategoryButton(
            nameImage: "image1",
            name: "test"
        )
    }
}
