//
//  LocationMapView.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/8/23.
//

import MapKit
import UIKit

class LocationMapView: UIView {
  var mapView: MKMapView!

  override init(frame: CGRect) {
    super.init(frame: frame)
    styleMap()
    layoutMap()
  }

  required init?(coder: NSCoder) {
    fatalError("No Coder, No Dice")
  }
}

extension LocationMapView {
  private func styleMap() {
    mapView = MKMapView()
    mapView.translatesAutoresizingMaskIntoConstraints = false
    mapView.showsCompass = true
    mapView.showsScale = true
  }

  private func layoutMap() {
    addSubview(mapView)
    NSLayoutConstraint.activate([
      mapView.widthAnchor.constraint(equalTo: widthAnchor),
      mapView.heightAnchor.constraint(equalToConstant: 300),
      mapView.topAnchor.constraint(equalTo: topAnchor),
      mapView.leadingAnchor.constraint(equalTo: leadingAnchor),
      mapView.trailingAnchor.constraint(equalTo: trailingAnchor),
      mapView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
}

extension LocationMapView {
  func setLocation(for location: PFLocation) {
    let mappedLocation = MappedLocation(location: location)
    mapView.addAnnotation(mappedLocation)
    centerToLocation(mappedLocation.coordinate, radius: 1000)
    print("added")
  }

  private func centerToLocation(_ location: CLLocationCoordinate2D,
                                radius: CLLocationDistance) {
    let region = MKCoordinateRegion(center: location,
                                    latitudinalMeters: radius,
                                    longitudinalMeters: radius)
    mapView.setRegion(region, animated: true)
  }
}
