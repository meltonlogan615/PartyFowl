//
//  Tester.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/9/23.
//

import UIKit

class EmptyView: UIView {
  // MARK: - Properties
  private var emptyTitleText: UILabel = {
    let emptyText = UILabel()
    emptyText.textColor = .secondaryLabel
    emptyText.adjustsFontSizeToFitWidth = true
    emptyText.minimumScaleFactor = 0.9
    emptyText.lineBreakMode = .byTruncatingTail
    emptyText.textAlignment = .center
    emptyText.numberOfLines = 0
    emptyText.font = UIFont.systemFont(ofSize: 28, weight: .bold)
    emptyText.translatesAutoresizingMaskIntoConstraints = false
    return emptyText
  }()

  private var logoImageView: UIImageView = {
    let logoImage = UIImageView()
    logoImage.image = UIImage(named: "bird")
    logoImage.translatesAutoresizingMaskIntoConstraints = false
    return logoImage
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
//    configureMessageLabel()
//    configureLogoImage()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  init(message: String) {
    super.init(frame: .zero)
    emptyTitleText.text = message
    configure()
  }

  // MARK: - Setup UI
  private func configure() {
    addSubview(emptyTitleText)
    configureMessageLabel()
    addSubview(logoImageView)
    configureLogoImage()
  }

  private func configureMessageLabel() {
    NSLayoutConstraint.activate([
      emptyTitleText.centerXAnchor.constraint(equalTo: centerXAnchor),
      emptyTitleText.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -150),
      emptyTitleText.widthAnchor.constraint(equalToConstant: 200)
    ])
  }

  private func configureLogoImage() {
    NSLayoutConstraint.activate([
      logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor),
      logoImageView.heightAnchor.constraint(equalTo: self.widthAnchor),
      logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 170),
      logoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 40)
    ])
  }
}

class FavoritesListViewController: UIViewController {
  // MARK: - Properties
  var favorites: [String] = []
  var emptyView: EmptyView!
  override func viewDidLoad() {
    super.viewDidLoad()
    showEmptyView()
  }

  // MARK: - Set up UI
  func showEmptyView() {
    emptyView = EmptyView(message: "No favorite hot chicken added, go burn yourself on the stove.")
    emptyView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(emptyView)
    NSLayoutConstraint.activate([
      emptyView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      emptyView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      emptyView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      emptyView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}
