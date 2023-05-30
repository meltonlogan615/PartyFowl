//
//  OrderItemViewController.swift
//  PartyFowl
//
<<<<<<< HEAD
//  Created by Logan Melton on 5/30/23.
=======
//  Created by Logan Melton on 5/28/23.
>>>>>>> 1a87b4cd2d8457129edabedbbdab17747aff1648
//

import UIKit

class OrderItemViewController: UIViewController {
  var item: PFMenuItem!
  var itemView: OrderItemView!

  override func viewDidLoad() {
    super.viewDidLoad()

    styleView()
    layoutView()
    itemView.fillStack(with: item)
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back",
                                                       image: UIImage(systemName: "chevron.left"),
                                                       target: self,
                                                       action: #selector(dismissView))

    styleOrderView()
    layoutOrderView()
  }
}

extension OrderItemViewController {

  private func styleView() {
    itemView = OrderItemView()
    itemView.translatesAutoresizingMaskIntoConstraints = false
  }

  private func layoutView() {
    view.addSubview(itemView)
    NSLayoutConstraint.activate([
      itemView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      itemView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
      view.trailingAnchor.constraint(equalToSystemSpacingAfter: itemView.trailingAnchor, multiplier: 2),
      itemView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)

  private func styleOrderView() {
    itemView = OrderItemView()
    itemView.translatesAutoresizingMaskIntoConstraints = false
    itemView.itemLabel.text = item.menuItem
    itemView.descriptionLabel.text = item.description
  }

  private func layoutOrderView() {
    view.addSubview(itemView)
    NSLayoutConstraint.activate([
      itemView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      itemView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      itemView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      itemView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
}
