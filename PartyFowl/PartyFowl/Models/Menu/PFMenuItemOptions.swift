//
//  PFMenuItemOptions.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/31/23.
//

import Foundation

enum PFMenuItemOptions: String, Codable, CaseIterable {
  case chickenStyle = "chicken style"
  case dressingChoice = "dressing choice"
  case sides, modifications
  case extraSauces = "extra sauces"
  case tempOption = "temp option"
}
