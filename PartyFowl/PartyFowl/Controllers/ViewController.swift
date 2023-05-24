//
//  ViewController.swift
//  PartyFowl
//
//  Created by Logan Melton on 4/29/23.
//

import UIKit

class ViewController: UIViewController {
  var locationView: LocationButtonsView!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.w
    style()
    layout()
  }
}

extension ViewController {
  private func style() {
    locationView = LocationButtonsView()
    locationView.translatesAutoresizingMaskIntoConstraints = false
  }

  private func layout() {
    view.addSubview(locationView)

    NSLayoutConstraint.activate([
      locationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      locationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      locationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      locationView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
}
