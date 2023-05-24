//
//  OrderCell.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/18/23.
//

import UIKit

class OrderCell: UITableViewCell {
  static let reuseID = "orderCell"
  var itemLabel: UILabel!
  var descrptionLable: UILabel!
  var priceLabel: UILabel!

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: OrderCell.reuseID)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
