//
//  OrderItemViewController.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/30/23.
//

import UIKit

class OrderItemViewController: UIViewController {
  var item: PFMenuItem!
  var itemHeader: ItemViewHeader!
  var optionsTable: ItemsTable!
  var sections: [PFMenuItemOptions] = []
  var addToOrderButton: ActionButton!

  var itemToOrder = PFItemOrder()

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back",
                                                       image: UIImage(systemName: "chevron.left"),
                                                       target: self,
                                                       action: #selector(dismissView))
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cart",
                                                        image: UIImage(systemName: "cart"),
                                                        target: self,
                                                        action: #selector(cartTapped))
    styleOrderView()
    layoutOrderView()
  }
}

extension OrderItemViewController {
  private func styleOrderView() {
    itemHeader = ItemViewHeader()
    itemHeader.translatesAutoresizingMaskIntoConstraints = false
    itemHeader.fillStack(with: item)

    optionsTable = ItemsTable()
    optionsTable.translatesAutoresizingMaskIntoConstraints = false

    setupSections(for: item)
    optionsTable.table.dataSource = self
    optionsTable.table.delegate = self
    optionsTable.backgroundColor = .blue

    addToOrderButton = ActionButton(titled: "Add To Order")
    addToOrderButton.translatesAutoresizingMaskIntoConstraints = false
    addToOrderButton.addTarget(self, action: #selector(itemAddedToOrder), for: .touchUpInside)
  }

  private func layoutOrderView() {
    view.addSubview(itemHeader)
    NSLayoutConstraint.activate([
      itemHeader.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
      itemHeader.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      itemHeader.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])

    view.addSubview(optionsTable)
    NSLayoutConstraint.activate([
      optionsTable.topAnchor.constraint(equalToSystemSpacingBelow: itemHeader.bottomAnchor, multiplier: 1),
      optionsTable.leadingAnchor.constraint(equalTo: itemHeader.leadingAnchor),
      optionsTable.trailingAnchor.constraint(equalTo: itemHeader.trailingAnchor),
      view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: optionsTable.bottomAnchor,
                                                       multiplier: 6)
    ])

    view.addSubview(addToOrderButton)
    NSLayoutConstraint.activate([
      addToOrderButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 4),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: addToOrderButton.trailingAnchor, multiplier: 4),
      view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: addToOrderButton.bottomAnchor,
                                                       multiplier: 2)
    ])
  }
}

extension OrderItemViewController {
  func setupSections(for item: PFMenuItem) {
    if item.chickenStyle {
      sections.append(PFMenuItemOptions.chickenStyle)
    }
    if item.dressingChoice {
      sections.append(PFMenuItemOptions.dressingChoice)
    }
    if item.sides != nil {
      sections.append(PFMenuItemOptions.sides)
    }
    if item.modifications != nil {
      sections.append(PFMenuItemOptions.modifications)
    }
    if item.extraSauces {
      sections.append(PFMenuItemOptions.extraSauces)
    }
    if item.tempOption {
      sections.append(PFMenuItemOptions.tempOption)
    }
  }
}

extension OrderItemViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sections.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemContainerCell.reuseID,
                                                     for: indexPath) as? ItemContainerCell else {
      return UITableViewCell()
    }
    cell.titleLabel.text = sections[indexPath.row].rawValue.capitalized
    return cell
  }
}

extension OrderItemViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let optionView = OptionsViewController(menuItem: item, options: sections[indexPath.row])
    optionView.itemToOrder = self.itemToOrder
    let nav = UINavigationController(rootViewController: optionView)
    nav.modalPresentationStyle = .pageSheet
    nav.navigationBar.backgroundColor = .systemBackground
    optionView.title = sections[indexPath.row].rawValue.capitalized
    if let sheet = nav.sheetPresentationController {
      sheet.detents = [.large()]
      sheet.prefersScrollingExpandsWhenScrolledToEdge = false
      sheet.largestUndimmedDetentIdentifier = .medium
    }
    present(nav, animated: true)
  }
}

extension OrderItemViewController {
  @objc
  func itemAddedToOrder() {
    print("poop")
    print(itemToOrder.chickenStyle)
    print(itemToOrder.modifications)
//    itemToOrder = PFItemOrder(itemName: item.menuItem)
  }
}
