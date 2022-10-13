import SwiftUI

struct UIKitSearch: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: SearchViewController())
        return navigationController
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

struct UIKitSearch_Previews: PreviewProvider {
    static var previews: some View {
        UIKitSearch()
    }
}
