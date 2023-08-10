//
//  PFMenuOption.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/2/23.
//

import Foundation

enum PFMenuCategory: String, CaseIterable, Codable, PFMenuOption {
  case nashvilleHotChicken = "nashville hot chicken"
  case forTheTable = "for the table"
  case gumboAndSalads = "gumbo & salads"
  case notHotChicken = "not hot chicken"
  case sides, beverages
  case tastyTreats = "tasty treats"
  case boozySlushies = "boozie slushies"
  case cocktails
  case bottlesAndCans = "bottles & cans"
  case nonalcoholic = "non-alcoholic"
  case wine
  case weekendBrunchForTheTable = "weekend brunch - for the table"
  case weekendBrunchEntrees = "weekend brunch - entrees"
  case kidsMenu = "kids menu"
  case kidsBrunch = "kids brunch"
}
