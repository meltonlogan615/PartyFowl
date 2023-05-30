//
//  OrderViewController.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/18/23.
//

import Combine
import UIKit

class OrderViewController: UIViewController {

  var options = PFMenuOption.allCases
  var orderView: OrderView!
  var menuResults: [PFMenuResults]!
  var menuItems: [PFMenuItem]!
  var selectedIndex: Int = 0

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back",
                                                       image: UIImage(systemName: "chevron.left"),
                                                       target: self,
                                                       action: #selector(dismissView))
    getMenu(for: "nashvilleMenu")
    styleOrdering()
    layoutOrdering()
  }
}

extension OrderViewController {
  private func styleOrdering() {
    orderView = OrderView()
    orderView.translatesAutoresizingMaskIntoConstraints = false
    orderView.tableView.dataSource = self
    orderView.tableView.delegate = self
    activateCategoryButtons(in: orderView.menuOptions)
  }

  private func layoutOrdering() {
    view.addSubview(orderView)
    NSLayoutConstraint.activate([
      orderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      orderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      orderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      orderView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}

extension OrderViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return menuResults[selectedIndex].menuItems.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let item = menuResults[selectedIndex].menuItems[indexPath.item]
    guard let cell = orderView.tableView.dequeueReusableCell(withIdentifier: OrderCell.reuseID,
                                                             for: indexPath) as? OrderCell else {
      return UITableViewCell()
    }

    cell.itemLabel.text = item.menuItem
    if let cost = item.cost {
      if cost.truncatingRemainder(dividingBy: 1) == 0 {
        cell.priceLabel.text = String(format: "%.0f", cost)
      } else {
        cell.priceLabel.text = String(format: "%.2f", cost)
      }
    }
    cell.descriptionLabel.text = item.description
    return cell
  }
}

extension OrderViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let item = menuResults[selectedIndex].menuItems[indexPath.item]
    let destination = OrderItemViewController()
    destination.item = item
    let nav = PFNavController(rootViewController: destination)
    nav.modalPresentationStyle = .fullScreen
    nav.modalTransitionStyle = .flipHorizontal
    present(nav, animated: true)
  }
}

extension OrderViewController {
  private func getMenu(for category: String) {
    let dataGatherer = LocalNetworking()
    menuResults = dataGatherer.getMenu(for: category)
  }
}

extension OrderViewController {
  func activateCategoryButtons(in view: MenuOptions) {
    for button in view.stack.arrangedSubviews {
      guard let button = button as? UIButton else { return }
      button.addTarget(self, action: #selector(optionSelected), for: .touchUpInside)
    }
  }

  @objc
  func optionSelected(_ sender: UIButton) {
    selectedIndex = sender.tag
    orderView.menuOptions.updatedSelectedButtonColor(at: sender.tag)
    orderView.tableView.reloadData()
    orderView.tableView.scrollToTop()
    orderView.menuOptions.scrollView.scrollToCenter(sender)
  }
}
