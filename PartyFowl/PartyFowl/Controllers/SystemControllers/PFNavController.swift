//
//  PFNavController.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/4/23.
//

import UIKit

class PFNavController: UINavigationController {
  var imageView = UIImageView(image: UIImage(named: "PFLogo"))
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationBar.prefersLargeTitles = false
    let appearance = UINavigationBarAppearance()
    appearance.titleTextAttributes = [.foregroundColor: K.brandRed!,
                                      .font: UIFont.boldSystemFont(ofSize: 15)]
    appearance.backgroundImageContentMode = .scaleToFill
    appearance.backgroundColor = .black
    navigationBar.standardAppearance = appearance
    navigationBar.scrollEdgeAppearance = appearance
    imageView.translatesAutoresizingMaskIntoConstraints = false
    navigationBar.addSubview(imageView)
    NSLayoutConstraint.activate([
      imageView.heightAnchor.constraint(equalToConstant: 28),
      imageView.widthAnchor.constraint(equalToConstant: navigationBar.frame.width - 300),
      imageView.centerXAnchor.constraint(equalTo: navigationBar.centerXAnchor),
      imageView.centerYAnchor.constraint(equalTo: navigationBar.centerYAnchor)
    ])
  }
}

// Hermitage Medical Associates
