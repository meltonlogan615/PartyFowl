//
//  OptionsTable.swift
//  PartyFowl
//
//  Created by Logan Melton on 6/30/23.
//

import UIKit

class ItemsTable: UIView {
  var table: UITableView!
  var sections: [PFMenuItemOptions] = []

  override init(frame: CGRect) {
    super.init(frame: frame)
    styleView()
    layoutView()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension ItemsTable {
  private func styleView() {
    table = UITableView()
    table.translatesAutoresizingMaskIntoConstraints = false
    table.register(ItemContainerCell.self, forCellReuseIdentifier: ItemContainerCell.reuseID)
  }

  private func layoutView() {
    addSubview(table)
    NSLayoutConstraint.activate([
      table.topAnchor.constraint(equalTo: topAnchor),
      table.leadingAnchor.constraint(equalTo: leadingAnchor),
      table.trailingAnchor.constraint(equalTo: trailingAnchor),
      table.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
}
