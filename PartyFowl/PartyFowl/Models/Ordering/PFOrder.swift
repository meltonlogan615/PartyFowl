//
//  PFOrder.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/18/23.
//

import Foundation

enum DeliveryMethod: String, Codable, CaseIterable {
  case pickup, grubhub
}

struct PFItemOrder: Codable {
  var customerName: String
  var itemName: String
  var heatLevel: PFHeatOption?
  var qty: Int
}

struct PFOrder: Codable {
  var customer: String
  var timeOrderPlaced = Date.now
  var deliveryMethod: DeliveryMethod
  var orderedItems: [PFItemOrder]
}
