//
//  OrderView.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/18/23.
//

import UIKit

class OrderView: UIView {

  var menuOptions: MenuOptions!
  var tableView: UITableView!

  override init(frame: CGRect) {
    super.init(frame: frame)
    styleOrderView()
    layoutOrderView()
  }

  required init?(coder: NSCoder) {
    fatalError("Coder no Coding")
  }
}

extension OrderView {
  private func styleOrderView() {
    menuOptions = MenuOptions()
    menuOptions.translatesAutoresizingMaskIntoConstraints = false

    tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(OrderCell.self,
                       forCellReuseIdentifier: OrderCell.reuseID)
  }

  private func layoutOrderView() {
    addSubview(menuOptions)
    NSLayoutConstraint.activate([
      menuOptions.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      menuOptions.leadingAnchor.constraint(equalTo: leadingAnchor),
      trailingAnchor.constraint(equalTo: menuOptions.trailingAnchor),
      menuOptions.heightAnchor.constraint(equalToConstant: 48)
    ])

    addSubview(tableView)
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalToSystemSpacingBelow: menuOptions.bottomAnchor,
                                     multiplier: 1),
      tableView.leadingAnchor.constraint(equalTo: menuOptions.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: menuOptions.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}
