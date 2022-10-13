import UIKit
import SwiftUI

class CategoryCell: UICollectionViewCell {
    static let identifier = "CategoryCell"
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
    
    // MARK: - Lifecycle
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    
    // MARK: - Settings
    
    func setupHierarchy() {
        contentView.addSubview(imageView)
        contentView.addSubview(label)
    }
    
    func setupLayout() {
        imageView.frame = contentView.bounds
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 15).isActive = true
        label.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -10).isActive = true
    }
    
    func configure(_ model: CategoryData) {
        label.text = model.name
        imageView.image = UIImage(named: model.nameImage)
        
    }
}

