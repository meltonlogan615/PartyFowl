//
//  PFChickenStyle.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/24/23.
//

import Foundation

enum PFChickenStyle: String, Codable, CaseIterable {
  case tossedSoutherFrield = "Southern Fried"
  case tossedMild = "mild"
  case tossedMedium = "medium"
  case tossedNashvilleHot = "nashville hot"
  case tossedPoultrygeist = "poultrygeist"
  case tossedGrilled = "grilled"
  case tossedBuffalo = "buffalo"
  case tossedJackDanielsBBQ = "jack daniel's BBQ"
  case tossedJerk = "Jerk"
  case tossedMemphisDryRub = "Memphis Dry Rub"
  case sfOnsideMild = "onside - mild"
  case sfOnsideMedium = "onside - medium"
  case sfOnsideHot = "onside - nashville hot"
  case sfOnsidePoult = "onside - poultrygeist"
  case sfOnsideBuff = "onside - buffalo"
  case sfOnsideJDBBQ = "onside - JD BBQ"
  case sfOnsideJerk = "onside - jerk"
  case sfOnsideMemphisDryRub = "onside - memphis dry rub"
}
