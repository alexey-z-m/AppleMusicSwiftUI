import SwiftUI

struct SearchView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(alignment: .leading) {
                    SearchTextFieldView(text: .constant(""))
                        .navigationTitle("Поиск")
                    Text("Поиск по категориям")
                        .bold()
                        .font(.title2)
                        .padding(.leading)
                    LazyVGrid(columns: [GridItem(),GridItem()]) {
                        ForEach(CategoryData.categoryData) { item in
                            SearchCategoryButton(
                                nameImage: item.nameImage,
                                name: item.name
                            )
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
