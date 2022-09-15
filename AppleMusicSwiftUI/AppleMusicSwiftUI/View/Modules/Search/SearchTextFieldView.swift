import SwiftUI

struct SearchTextFieldView: View {
    @Binding var text: String
    @State private var isEditing = false
    
    var body: some View {
        TextField("Ваша медиатека", text: $text)
            .padding(7)
            .padding(.horizontal, 30)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal, 10)
            .onTapGesture {
                self.isEditing = true
            }
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                        .padding(.horizontal, 10)
                    
                    if isEditing {
                        Button(action: {
                            self.text = ""
                        }) {
                            Image(systemName: "multiply.circle.fill")
                                .foregroundColor(.gray)
                                .padding(.trailing, 15)
                        }
                        
                    }
                }
            )
    }
}

struct SearchTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextFieldView(text: .constant(""))
    }
}
