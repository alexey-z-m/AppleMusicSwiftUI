import SwiftUI

struct EditLibrary: View {
    @State var selectedItems = Set<String>()
    
    var body: some View {
        List(selection: $selectedItems) {
            ForEach(LibraryData.libraryData) { item in
                ListItem(nameImage: item.nameImage, name: item.name, isSelected: selectedItems.contains(item.name))
            }
            .onMove { (indexSet, index) in
                LibraryData.libraryData.move(fromOffsets: indexSet, toOffset: index)
            }
        }
        .listStyle(.inset)
        .navigationTitle("Медиатека")
    }
}

struct EditLibrary_Previews: PreviewProvider {
    static var previews: some View {
        EditLibrary()
    }
}
