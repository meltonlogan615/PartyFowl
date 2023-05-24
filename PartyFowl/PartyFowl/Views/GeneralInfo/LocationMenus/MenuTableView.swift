//
//  MenuCollectionView.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/10/23.
//

import UIKit

class MenuTableView: UIView {
  var menuOptions: MenuOptions!
  var options = [String]()
  var tableView: UITableView!

  override init(frame: CGRect) {
    super.init(frame: frame)
    styleMenu()
    layoutMenu()
  }

  required init?(coder: NSCoder) {
    fatalError("No Code(r)")
  }
}

extension MenuTableView {
  private func styleMenu() {
    menuOptions = MenuOptions()
    menuOptions.translatesAutoresizingMaskIntoConstraints = false

    tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.register(MenuItemCell.self, forCellReuseIdentifier: MenuItemCell.reuseID)
  }

  private func layoutMenu() {
    addSubview(menuOptions)
    NSLayoutConstraint.activate([
      menuOptions.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      menuOptions.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor,
                                           multiplier: 1),
      trailingAnchor.constraint(equalToSystemSpacingAfter: menuOptions.trailingAnchor,
                                multiplier: 1),
      menuOptions.heightAnchor.constraint(equalToConstant: 48)
    ])

    addSubview(tableView)
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalToSystemSpacingBelow: menuOptions.bottomAnchor, multiplier: 1),
      tableView.leadingAnchor.constraint(equalTo: menuOptions.leadingAnchor),
      tableView.trailingAnchor.constraint(equalTo: menuOptions.trailingAnchor),
      tableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}
