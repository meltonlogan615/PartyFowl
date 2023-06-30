//
//  MenuViewController.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/8/23.
//

import UIKit

class MenuViewController: UIViewController {

  var menu: MenuTableView!
  var options = PFMenuCategory.allCases
  var menuResults: [PFMenuResults]!
  var menuItems: [PFMenuItem]!
  var selectedIndex: Int = 0

  override func viewDidLoad() {
    super.viewDidLoad()
    getMenu(for: "nashvilleMenu")
    styleMenu()
    layoutMenu()
    menu.tableView.reloadData()
  }
}

extension MenuViewController {
  private func styleMenu() {
    menu = MenuTableView()
    menu.translatesAutoresizingMaskIntoConstraints = false
    menu.tableView.dataSource = self
  }

  private func layoutMenu() {
    view.addSubview(menu)
    NSLayoutConstraint.activate([
      menu.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      menu.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      menu.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      menu.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}

extension MenuViewController {
  private func getMenu(for category: String) {
    let dataGatherer = LocalNetworking()
    menuResults = dataGatherer.getMenu(for: category)
  }
}

// MARK: - TABLEVIEW - DATASOURCE
extension MenuViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return menuResults[selectedIndex].menuItems.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: MenuItemCell.reuseID,
                                                        for: indexPath) as? MenuItemCell else {
      return UITableViewCell()
    }
    let item = menuResults[selectedIndex].menuItems[indexPath.item]
    cell.itemNameLabel.text = item.menuItem
    if let description = item.description {
      cell.descriptionLabel.text = description
    }
    if let cost = item.cost {
      if cost.truncatingRemainder(dividingBy: 1) == 0 {
        cell.priceLabel.text = "$\(String(format: "%.0f", cost))"
      } else {
        cell.priceLabel.text = "$\(String(format: "%.2f", cost))"
      }
    }
    if let notes = item.additionalInfo {
      cell.additionalInfoLabel.text = notes
    }
    return cell
  }
}
