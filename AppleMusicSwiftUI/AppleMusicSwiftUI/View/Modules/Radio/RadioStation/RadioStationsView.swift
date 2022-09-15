import SwiftUI

struct RadioStationsView: View {
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Text("Станции")
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
                .font(.largeTitle)
            
            LazyVGrid(columns: [GridItem()]) {
                ForEach(RadioData.radioData) { item in
                    RadioStationButton(
                        nameImage: item.nameImage,
                        name: item.name,
                        discription: item.discription
                    )
                    .foregroundColor(.accentColor)
                    Divider()
                }
            }
        }
    }
}

struct RadioStationsView_Previews: PreviewProvider {
    static var previews: some View {
        RadioStationsView()
    }
}
