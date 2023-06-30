//
//  OptionsTable.swift
//  PartyFowl
//
//  Created by Logan Melton on 6/30/23.
//

import UIKit

class OptionsTable: UIView {

  var table: UITableView!

  override init(frame: CGRect) {
    super.init(frame: frame)
    styleView()
    layoutView()
    table.register(OptionCell.self, forCellReuseIdentifier: OptionCell.reuseID)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension OptionsTable {
  private func styleView() {
    table = UITableView()
    table.translatesAutoresizingMaskIntoConstraints = false
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
