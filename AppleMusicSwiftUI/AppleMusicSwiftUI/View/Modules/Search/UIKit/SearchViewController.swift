import UIKit
import SwiftUI

class SearchViewController: UIViewController {
    private let model = CategoryData.categoryData
    private var filteredSongs = [SongData]()
    private var searchBarIsEmpty: Bool {
        guard let text = search.searchBar.text else { return false }
        return text.isEmpty
    }
    
    private var isFiltering: Bool {
        return search.isActive && !searchBarIsEmpty
    }
    
    private lazy var search: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.searchBar.placeholder = "Ваша медиатека"
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.definesPresentationContext = true
        return search
    }()
    
    private var collection: UICollectionView!
    private var table: UITableView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureTableView()
        setupHierarchy()
        setupLayout()
        setupView()
    }
    
    // MARK: - Settings
    
    func setupView() {
        title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.searchController = search
        collection.dataSource = self
        collection.delegate = self
        table.dataSource = self
        table.isHidden = true
        table.rowHeight = 90
    }
    
    func setupHierarchy() {
        view.addSubview(collection)
        view.addSubview(table)
    }
    
    func setupLayout() {
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
        collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        table.translatesAutoresizingMaskIntoConstraints = false
        table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        table.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        table.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func configureCollectionView() {
        let collectionView = UICollectionView(
            frame: .zero,
            collectionViewLayout: getLayout()
        )
        
        collectionView.register(
            CategoryCell.self,
            forCellWithReuseIdentifier: CategoryCell.identifier
        )
        
        collectionView.register(
            HeaderSearchCollectionReusableView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: HeaderSearchCollectionReusableView.identifier
        )
        
        collectionView.backgroundColor = .clear
        collection = collectionView
    }
    
    func configureTableView() {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        tableView.backgroundColor = .clear
        table = tableView
    }
    
    func getLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 0, bottom: 100, right: 0)
        layout.itemSize = CGSize(
            width: (view.frame.size.width / 2) - 20,
            height: 130
        )
        
        layout.minimumLineSpacing = 10
        layout.headerReferenceSize = CGSize(
            width: view.frame.size.width,
            height: 40
        )
        
        return layout
    }
}

extension SearchViewController: UISearchResultsUpdating, UISearchControllerDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        if isFiltering {
            collection.isHidden = true
            table.isHidden = false
        } else {
            collection.isHidden = false
            table.isHidden = true
        }
        
        filteredSongs = SongData.getSongs().filter({ song in
            return (song.songName + song.artistName).lowercased().contains(search.searchBar.text!.lowercased())
        })
        
        table.reloadData()
    }
}

extension SearchViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collection.dequeueReusableCell(
            withReuseIdentifier: CategoryCell.identifier,
            for: indexPath
        ) as? CategoryCell else {
            return UICollectionViewCell()
        }
        
        cell.configure(model[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let header = collection.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: HeaderSearchCollectionReusableView.identifier,
                for: indexPath
            ) as? HeaderSearchCollectionReusableView else {
                return UICollectionReusableView()
            }
            
            header.configure()
            return header
        } else {
            assert(false)
        }
    }
}

extension SearchViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        navigationController?.pushViewController(CategoryViewController(namecategory: model[indexPath.row].name), animated: true)
        return true
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        filteredSongs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = table.dequeueReusableCell(
            withIdentifier: TableViewCell.identifier,
            for: indexPath
        ) as? TableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(filteredSongs[indexPath.row])
        return cell
    }
}

final class CategoryViewController: UIHostingController<CategoryView> {
    private var namecategory: String
    init(namecategory: String) {
        self.namecategory = namecategory
        super.init(rootView: CategoryView(namecategory: namecategory))
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
