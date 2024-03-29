//
//  PFItemOrder.swift
//  PartyFowl
//
//  Created by Logan Melton on 7/24/23.
//

import Foundation

class PFItemOrder: Codable {
  var customerName: String?
  var itemName: String?
  var qty: Int?
  var chickenStyle: PFChickenStyle?
  var dressingChoice: PFDressingOption?
  var side: String?
  var modifications: [String]?
  var extraSauces: [String: Int]?
  var tempOption: PFTempOption?
  var deliveryMethod: PFDeliveryMethod?
}
