//
//  PFMappedLocation.swift
//  PartyFowl
//
//  Created by Logan Melton on 7/24/23.
//

import MapKit
import Foundation

class MappedLocation: NSObject, MKAnnotation {
  var coordinate: CLLocationCoordinate2D

  init(location: PFLocation) {
    self.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
  }
}
