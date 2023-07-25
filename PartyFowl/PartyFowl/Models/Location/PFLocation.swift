//
//  PFLocation.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/2/23.
//

import Foundation

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
