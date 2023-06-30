//
//  PFLocation.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/2/23.
//

import MapKit
import Foundation

enum PFLocationName: String, Codable, CaseIterable, Hashable {
  case downtown = "Downtown Nashville"
  case donelson, murfreesboro
  case coolSprings = "Cool Springs (Franklin, TN)"
  case hamitlonPlace = "Hamilton Place (Chattanooga, TN)"
  case destin
}

struct PFLocation: Codable {
  var name: String
  var streetAddress: String
  var city: String
  var state: String
  var zip: Int
  var addressDescription: String
  var latitude: Double
  var longitude: Double
  var phone: String
  var hoursEffectiveDate: String
  var hoursMonday: String
  var hoursTuesday: String
  var hoursWednesday: String
  var hoursThursday: String
  var hoursFriday: String
  var hoursSaturday: String
  var hoursSunday: String
  var hoursNotes: String?
  var brunchFriday: String?
  var brunchSaturday: String
  var brunchSunday: String
  var brunchSpecial: String?
  var happyHour: String
  var happyHourNotes: [String]?
  var kidsEatFree: String?
  var menu: String?
  var info: String
}

class MappedLocation: NSObject, MKAnnotation {
  var coordinate: CLLocationCoordinate2D

  init(location: PFLocation) {
    self.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
  }
}
