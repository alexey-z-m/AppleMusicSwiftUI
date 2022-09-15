import SwiftUI

struct LibraryView: View {
    @State var editLibrary = false
    
    var body: some View {
        NavigationView {
            if editLibrary {
                EditLibrary()
                    .environment(\.editMode, .constant(EditMode.active))
                    .navigationBarItems(trailing: Button(action: {
                        editLibrary.toggle()
                    }) {
                        Text("Готово")
                            .foregroundColor(.red)
                    })
            } else {
                MainLibrary()
                    .navigationBarItems(trailing: Button(action: {
                        editLibrary.toggle()
                    }) {
                        Text("Править")
                            .foregroundColor(.red)
                    })
            }
                
        }
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView()
            .preferredColorScheme(.dark)
    }
}
