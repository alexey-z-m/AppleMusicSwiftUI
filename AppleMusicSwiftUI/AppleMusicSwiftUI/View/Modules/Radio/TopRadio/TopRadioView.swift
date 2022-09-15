import SwiftUI

struct TopRadioView: View {
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem()]) {
                ForEach(RadioData.radioData) { item in
                    TopRadioButton(
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

struct TopRadioView_Previews: PreviewProvider {
    static var previews: some View {
        TopRadioView()
    }
}
