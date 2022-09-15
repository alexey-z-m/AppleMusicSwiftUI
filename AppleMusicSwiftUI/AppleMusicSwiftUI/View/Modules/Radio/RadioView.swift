import SwiftUI

struct RadioView: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                Divider()
                    .padding(.leading)
                TopRadioView()
                Divider()
                    .padding(.leading)
                RadioStationsView()
            }
            .navigationTitle("Радио")
        }
    }
}

struct RadioView_Previews: PreviewProvider {
    static var previews: some View {
        RadioView()
    }
}
