import UIKit

class TableViewCell: UITableViewCell {
    static let identifier = "TableViewCell"
    
    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
    
    private lazy var songName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 15, weight: .bold)
        return label
    }()
    
    private lazy var songArtist: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(songName)
        contentView.addSubview(songArtist)
        contentView.addSubview(image)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // MARK: - Settings
    
    func setupLayout() {
        image.translatesAutoresizingMaskIntoConstraints = false
        image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
        image.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        image.heightAnchor.constraint(equalTo: contentView.heightAnchor, constant: -10).isActive = true
        image.widthAnchor.constraint(equalTo: contentView.heightAnchor,constant: -10).isActive = true
        songName.translatesAutoresizingMaskIntoConstraints = false
        songName.topAnchor.constraint(equalTo: image.topAnchor, constant: 10).isActive = true
        songName.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10).isActive = true
        songArtist.translatesAutoresizingMaskIntoConstraints = false
        songArtist.topAnchor.constraint(equalTo: songName.bottomAnchor, constant: 5).isActive = true
        songArtist.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10).isActive = true
    }
    
    func configure(_ model: SongData) {
        image.image = UIImage(named: model.nameImage)
        songName.text = model.songName
        songArtist.text = model.artistName
    }
}
