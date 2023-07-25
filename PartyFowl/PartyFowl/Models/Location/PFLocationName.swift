//
//  PFLocationName.swift
//  PartyFowl
//
//  Created by Logan Melton on 7/24/23.
//

import Foundation

enum PFLocationName: String, Codable, CaseIterable, Hashable {
  case downtown = "Downtown Nashville"
  case donelson, murfreesboro
  case coolSprings = "Cool Springs (Franklin, TN)"
  case hamitlonPlace = "Hamilton Place (Chattanooga, TN)"
  case destin
}
