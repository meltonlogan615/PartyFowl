//
//  LocationViewController.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/2/23.
//

import MapKit
import UIKit

class LocationViewController: UIViewController, MKMapViewDelegate {
  var location: PFLocation!
  var locationImage = UIImageView()
  var locationLabel: CATextLayer!
  var imageLayer: CALayer!
  var locationView: LocationView!

  override func viewDidLoad() {
    super.viewDidLoad()
    StatusBar.setColor(for: view)
    view.backgroundColor = .systemBackground
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back",
                                                       image: UIImage(systemName: "chevron.left"),
                                                       target: self,
                                                       action: #selector(dismissView))

    styleLocation()
    layoutLocation()
  }
}

extension LocationViewController {
  private func styleLocation() {
    locationImage.image = UIImage(named: location.name.lowercased())
    imageLayer = CALayer()
    imageLayer.frame = CGRect(x: 0, y: 70, width: view.frame.width,
                              height: view.frame.width * 0.8)

    imageLayer.backgroundColor = UIColor.gray.cgColor
    imageLayer.contents = locationImage.image?.cgImage

    let insets = UIEdgeInsets(top: view.frame.width * 0.75,
                              left: 0,
                              bottom: 0,
                              right: 0)

    locationLabel = CATextLayer()
    locationLabel.font = UIFont(name: "Helvetica-Bold", size: 32)
    locationLabel.frame = CGRect(x: 8,
                                 y: imageLayer.frame.height - 70,
                                 width: view.frame.width,
                                 height: imageLayer.frame.height)
    locationLabel.string = location.name.uppercased()

    locationView = LocationView()
    locationView.translatesAutoresizingMaskIntoConstraints = false
    locationView.scrollView.contentInset = insets
    locationView.buttonView.orderOnlineButton.addTarget(self,
                                                        action: #selector(orderOnlineButtonBooped),
                                                        for: .touchUpInside)
    locationView.buttonView.grubHubButton.addTarget(self, action: #selector(buttonBooped), for: .touchUpInside)
    locationView.hoursView.setHours(for: location)
    locationView.hoursView.setBrunchHours(for: location)
    locationView.hoursView.setHappyHours(for: location)
    locationView.hoursView.setKidsHours(for: location)
    locationView.addressView.setAddress(for: location)
    locationView.mapView.setLocation(for: location)
  }
  @objc
  func buttonBooped() {
    print("boop")
  }

  @objc
  func orderOnlineButtonBooped() {
    let orderVC = OrderViewController()
    let navVC = PFNavController(rootViewController: orderVC)
    navVC.modalPresentationStyle = .fullScreen
    navVC.modalTransitionStyle = .flipHorizontal
    present(navVC, animated: true)
  }

  private func layoutLocation() {
    view.layer.addSublayer(imageLayer)
    imageLayer.addSublayer(locationLabel)
    view.addSubview(locationView)
    NSLayoutConstraint.activate([
      locationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      locationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      locationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      locationView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}
