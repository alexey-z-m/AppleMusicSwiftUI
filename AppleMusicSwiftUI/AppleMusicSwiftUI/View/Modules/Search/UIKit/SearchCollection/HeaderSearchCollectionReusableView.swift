import UIKit

class HeaderSearchCollectionReusableView: UICollectionReusableView {
    static let identifier = "HeaderSearchCollectionReusableView"
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 22, weight: .bold)
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
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
    
    func configure() {
        label.text = "Поиск по категориям"
    }
}
