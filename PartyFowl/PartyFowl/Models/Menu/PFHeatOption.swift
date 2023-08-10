//
//  PFHeatOption.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/16/23.
//

import Foundation

enum PFHeatOption: String, CaseIterable, Codable, PFMenuOption {
  case southernFried = "southern fried"
  case mild, medium
  case nashvilleHot = "nashville hot"
  case poultrygeist
}

enum PFTempOption: String, Codable, CaseIterable {
  case rare
  case mediumRare = "medium rare"
  case medium
  case mediumWell = "medium well"
  case wellDone = "well done"
}
