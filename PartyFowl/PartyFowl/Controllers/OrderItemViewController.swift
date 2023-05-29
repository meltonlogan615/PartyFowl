//
//  OrderItemViewController.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/28/23.
//

import UIKit

class OrderItemViewController: UIViewController {
  var item: PFMenuItem!
  var itemView: OrderItemView!

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back",
                                                       image: UIImage(systemName: "chevron.left"),
                                                       target: self,
                                                       action: #selector(dismissView))

    styleOrderView()
    layoutOrderView()
  }
}

extension OrderItemViewController {
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
