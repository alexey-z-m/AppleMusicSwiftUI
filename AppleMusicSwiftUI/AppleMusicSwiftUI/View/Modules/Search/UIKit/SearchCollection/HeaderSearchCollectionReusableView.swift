import UIKit

class HeaderSearchCollectionReusableView: UICollectionReusableView {
    static let identifier = "HeaderSearchCollectionReusableView"
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 21, weight: .bold)
        return label
    }()
    
    // MARK: - Lifecycle
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
        configure()
    }
    
    // MARK: - Settings
    
    func setupHierarchy() {
        addSubview(label)
        
    }
    
    func setupLayout() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    func configure() {
        label.text = "Поиск по категориям"
    }
}
