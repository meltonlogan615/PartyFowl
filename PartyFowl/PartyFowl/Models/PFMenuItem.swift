//
//  PFMenuItem.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/9/23.
//

import Foundation

struct PFMenuItem: Codable, Comparable {
  var menuItem: String
  var description: String?
  var cost: Double?
  var additionalInfo: String?

  static func < (lhs: Self, rhs: Self) -> Bool {
    return lhs.menuItem < rhs.menuItem
  }
}

struct PFMenuResults: Codable {
  var category: String
  var menuItems: [PFMenuItem]
}
