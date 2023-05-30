//
//  OrderItemViewController.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/30/23.
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
    ])
  }
}
