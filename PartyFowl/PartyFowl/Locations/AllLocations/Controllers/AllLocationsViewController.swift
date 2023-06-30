//
//  AllLocationsViewController.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/2/23.
//

import UIKit

class AllLocationsViewController: UIViewController {
  var headlineLabel: UILabel!
  var subheadingLabel: UILabel!
  var collection: UICollectionView!
  var allLocations: [PFLocation]!

  override func viewDidLoad() {
    super.viewDidLoad()
    StatusBar.setColor(for: view)
    styleView()
    layoutView()
    navigationController?.isNavigationBarHidden = false
    navigationController?.navigationBar.tintColor = .black
  }
}

extension AllLocationsViewController {
  private func styleView() {
    getLocations()
    headlineLabel = UILabel()
    headlineLabel.translatesAutoresizingMaskIntoConstraints = false
    headlineLabel.font = UIFont(name: "NotoSansOriya-Bold", size: 32)
    headlineLabel.textColor = K.brandRed
    headlineLabel.text = "YOU'RE WELCOME AT OUR COOP ANYTIME!"
    headlineLabel.textAlignment = .center
    headlineLabel.numberOfLines = 0

    subheadingLabel = UILabel()
    subheadingLabel.translatesAutoresizingMaskIntoConstraints = false
    subheadingLabel.font = UIFont(name: "NotoSansOriya-Bold", size: 20)
    subheadingLabel.textColor = K.brandRed
    subheadingLabel.text = "CLICK A STORE BELOW FOR LOCATION-SPECIFIC INFORMATION"
    subheadingLabel.textAlignment = .center
    subheadingLabel.numberOfLines = 0

    collection = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
    collection.translatesAutoresizingMaskIntoConstraints = false
    collection.register(LocationCell.self, forCellWithReuseIdentifier: LocationCell.reuseID)
    collection.backgroundColor = K.brandRed
    collection.dataSource = self
    collection.delegate = self
  }

  private func layoutView() {
    view.addSubview(headlineLabel)
    NSLayoutConstraint.activate([
      headlineLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
      headlineLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: headlineLabel.trailingAnchor, multiplier: 2)
    ])

    view.addSubview(subheadingLabel)
    NSLayoutConstraint.activate([
      subheadingLabel.topAnchor.constraint(equalToSystemSpacingBelow: headlineLabel.bottomAnchor, multiplier: 1),
      subheadingLabel.leadingAnchor.constraint(equalTo: headlineLabel.leadingAnchor),
      subheadingLabel.trailingAnchor.constraint(equalTo: headlineLabel.trailingAnchor)
    ])

    view.addSubview(collection)
    NSLayoutConstraint.activate([
      collection.topAnchor.constraint(equalToSystemSpacingBelow: subheadingLabel.bottomAnchor, multiplier: 2),
      collection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      collection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}

extension AllLocationsViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return allLocations.count
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collection.dequeueReusableCell(withReuseIdentifier: LocationCell.reuseID,
                                                    for: indexPath) as? LocationCell else {
      return UICollectionViewCell()
    }
    cell.configureCell(with: allLocations[indexPath.item])
    return cell
  }
}

// MARK: - CollectionView - Compositional Layout
extension AllLocationsViewController {
  func createCompositionalLayout() -> UICollectionViewLayout {
    let layout = UICollectionViewCompositionalLayout { _, _ in
      return self.createGroup()
    }
    let config = UICollectionViewCompositionalLayoutConfiguration()
    config.interSectionSpacing = 50
    layout.configuration = config
    return layout
  }

  func createGroup() -> NSCollectionLayoutSection {
    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                          heightDimension: .fractionalHeight(0.95))

    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                           heightDimension: .fractionalHeight(1))

    let sectionSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                             heightDimension: .estimated(300))

    let item = NSCollectionLayoutItem(layoutSize: itemSize)
    let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                   subitems: [item])
    let sectionAssembly = NSCollectionLayoutGroup.vertical(layoutSize: sectionSize,
                                                           subitems: [group])
    let section = NSCollectionLayoutSection(group: sectionAssembly)
    return section
  }
}

extension AllLocationsViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let destination = LocationViewController()
    let location = allLocations[indexPath.item]
    destination.location = location
    let navVC = PFNavController(rootViewController: destination)
    navVC.modalPresentationStyle = .fullScreen
    navVC.modalTransitionStyle = .flipHorizontal
    present(navVC, animated: true)
  }
}

// MARK: - Getting Location Information
extension AllLocationsViewController {
  private func getLocations() {
    let dataGatherer = LocalNetworking()
    allLocations = dataGatherer.readLocal(fileName: "locations") ?? []
  }
}
