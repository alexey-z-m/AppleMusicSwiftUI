import SwiftUI

struct ListItem: View {
    var nameImage: String
    var name: String
    var isSelected: Bool
    
    var body: some View {
        HStack {
            Image(systemName: nameImage)
                .foregroundColor(.red)
            if isSelected {
                Text(name)
                    .bold()
            } else {
                Text(name)
            }
        }
    }
}
