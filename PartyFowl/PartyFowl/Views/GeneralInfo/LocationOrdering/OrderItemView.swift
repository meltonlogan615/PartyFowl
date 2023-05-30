//
//  OrderItemView.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/30/23.
//

import UIKit

class OrderItemView: UIView {
  var scroll: UIScrollView!
  var content: UIView!
  var stack: UIStackView!

  var itemNameLabel: UILabel!
  var itemDescriptionLabel: UILabel!
  var additionalInfoLabel: UILabel!
  var costLabel: UILabel!
  var dressingChoiceLabel: UILabel!
  var modificationLabel: UILabel!
  var extraSauceLabel: UILabel!
  var tempOptionLabel: UILabel!

  override init(frame: CGRect) {
    super.init(frame: frame)
    styleItemView()
    layoutItemView()
  }

  required init?(coder: NSCoder) {
    fatalError("No Coder Coding")
  }
}

extension OrderItemView {
  private func styleItemView() {
    scroll = UIScrollView()
    scroll.translatesAutoresizingMaskIntoConstraints = false
    content = UIView()
    content.translatesAutoresizingMaskIntoConstraints = false
    stack = UIStackView()
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .vertical
    stack.distribution = .fillProportionally
    stack.spacing = 16

    itemNameLabel = UILabel()
    itemNameLabel.translatesAutoresizingMaskIntoConstraints = false
    itemNameLabel.font = .preferredFont(forTextStyle: .headline)
    itemNameLabel.textAlignment = .center
    itemNameLabel.numberOfLines = 0

    itemDescriptionLabel = UILabel()
    itemDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    itemDescriptionLabel.font = .preferredFont(forTextStyle: .subheadline)
    itemDescriptionLabel.textAlignment = .justified
    itemDescriptionLabel.numberOfLines = 0

    additionalInfoLabel = UILabel()
    additionalInfoLabel.translatesAutoresizingMaskIntoConstraints = false
    additionalInfoLabel.font = .preferredFont(forTextStyle: .subheadline)
    additionalInfoLabel.textAlignment = .natural

    costLabel = UILabel()
    costLabel.translatesAutoresizingMaskIntoConstraints = false
    costLabel.font = .preferredFont(forTextStyle: .subheadline)
  }

  private func layoutItemView() {
    addSubview(scroll)
    NSLayoutConstraint.activate([
      scroll.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      scroll.leadingAnchor.constraint(equalTo: leadingAnchor),
      scroll.trailingAnchor.constraint(equalTo: trailingAnchor),
      scroll.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])

    scroll.addSubview(content)
    NSLayoutConstraint.activate([
      content.topAnchor.constraint(equalTo: scroll.topAnchor),
      content.leadingAnchor.constraint(equalTo: scroll.leadingAnchor),
      content.trailingAnchor.constraint(equalTo: scroll.trailingAnchor),
      content.bottomAnchor.constraint(equalTo: scroll.bottomAnchor),
      content.widthAnchor.constraint(equalTo: scroll.widthAnchor)
    ])

    content.addSubview(stack)
    NSLayoutConstraint.activate([
      stack.topAnchor.constraint(equalTo: content.topAnchor),
      stack.leadingAnchor.constraint(equalTo: content.leadingAnchor),
      stack.trailingAnchor.constraint(equalTo: content.trailingAnchor),
      stack.bottomAnchor.constraint(equalTo: content.bottomAnchor)
    ])
  }
}

extension OrderItemView {
  func fillStack(with item: PFMenuItem) {
    itemNameLabel.text = item.menuItem
    stack.addArrangedSubview(itemNameLabel)

    itemDescriptionLabel.text = item.description
    stack.addArrangedSubview(itemDescriptionLabel)

    additionalInfoLabel.text = item.additionalInfo
    stack.addArrangedSubview(additionalInfoLabel)

    if let cost = item.cost {
      if cost.truncatingRemainder(dividingBy: 1) == 0 {
        costLabel.text = String(format: "%.0f", cost)
      } else {
        costLabel.text = String(format: "%.2f", cost)
      }
    }
    
    if item.chickenStyle {
      for option in PFChickenStyle.allCases {
        let row: UIStackView = {
          let row = UIStackView()
          row.axis = .horizontal
          row.distribution = .equalSpacing

          let label = UILabel()
          label.translatesAutoresizingMaskIntoConstraints = false
          label.text = option.rawValue.capitalized
          row.addArrangedSubview(label)

          let toggle = UISwitch()
          toggle.translatesAutoresizingMaskIntoConstraints = false
          toggle.onTintColor = K.brandRed
          row.addArrangedSubview(toggle)
          return row
        }()
        stack.addArrangedSubview(row)
      }
    }
  }
}
