//
//  PFOrder.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/18/23.
//

import Foundation

class PFOrder: Codable {
  var customer: String?
  var timeOrderPlaced = Date.now
  var deliveryMethod: PFDeliveryMethod?
  var orderedItems: [PFItemOrder]?
}
