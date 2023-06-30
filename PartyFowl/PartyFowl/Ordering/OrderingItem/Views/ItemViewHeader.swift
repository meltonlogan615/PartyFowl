//
//  OrderItemView.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/30/23.
//

import UIKit

class ItemViewHeader: UIView {
  var stack: UIStackView!
  var itemNameLabel: UILabel!
  var itemDescriptionLabel: UILabel!
  var additionalInfoLabel: UILabel!
  var costLabel: UILabel!

  override init(frame: CGRect) {
    super.init(frame: frame)
    styleItemView()
    layoutItemView()
  }

  required init?(coder: NSCoder) {
    fatalError("No Coder Coding")
  }
}

extension ItemViewHeader {
  private func styleItemView() {
    stack = UIStackView()
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .vertical
    stack.distribution = .fillProportionally
    stack.spacing = 8

    itemNameLabel = UILabel()
    itemNameLabel.translatesAutoresizingMaskIntoConstraints = false
    itemNameLabel.font = .preferredFont(forTextStyle: .title2)
    itemNameLabel.textColor = K.brandRed
    itemNameLabel.textAlignment = .center
    itemNameLabel.numberOfLines = 0

    itemDescriptionLabel = UILabel()
    itemDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
    itemDescriptionLabel.font = .preferredFont(forTextStyle: .body)
    itemDescriptionLabel.textAlignment = .justified
    itemDescriptionLabel.numberOfLines = 0

    additionalInfoLabel = UILabel()
    additionalInfoLabel.translatesAutoresizingMaskIntoConstraints = false
    additionalInfoLabel.font = .preferredFont(forTextStyle: .subheadline)
    additionalInfoLabel.textAlignment = .natural

    costLabel = UILabel()
    costLabel.translatesAutoresizingMaskIntoConstraints = false
    costLabel.font = .preferredFont(forTextStyle: .subheadline)
    costLabel.textAlignment = .right
  }

  private func layoutItemView() {
    addSubview(stack)
    NSLayoutConstraint.activate([
      stack.topAnchor.constraint(equalTo: topAnchor),
      stack.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
      trailingAnchor.constraint(equalToSystemSpacingAfter: stack.trailingAnchor, multiplier: 2),
      stack.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
}

extension ItemViewHeader {
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
      stack.addArrangedSubview(costLabel)
    }
  }
}
//    setOptions(item: item)
//  }
//
//  private func setChickenOptions(for item: PFMenuItem) {
//    if item.chickenStyle {
//      for option in PFChickenStyle.allCases {
//        let row: UIStackView = {
//          let row = UIStackView()
//          row.translatesAutoresizingMaskIntoConstraints = false
//          row.axis = .horizontal
//          row.distribution = .equalSpacing
//
//          let label = UILabel()
//          label.translatesAutoresizingMaskIntoConstraints = false
//          label.text = option.rawValue.capitalized
//          row.addArrangedSubview(label)
//
//          let toggle = UISwitch()
//          toggle.translatesAutoresizingMaskIntoConstraints = false
//          toggle.onTintColor = K.brandRed
//          row.addArrangedSubview(toggle)
//          return row
//        }()
//        stack.addArrangedSubview(row)
//      }
//    }
//  }
//
//  private func setDressingOptions(for item: PFMenuItem) {
//    if item.dressingChoice {
//      for option in DressingOption.allCases {
//        let row: UIStackView = {
//          let row = UIStackView()
//          row.translatesAutoresizingMaskIntoConstraints = false
//          row.axis = .horizontal
//          row.distribution = .equalSpacing
//
//          let label = UILabel()
//          label.translatesAutoresizingMaskIntoConstraints = false
//          label.text = option.rawValue.capitalized
//          row.addArrangedSubview(label)
//
//          let toggle = UISwitch()
//          toggle.translatesAutoresizingMaskIntoConstraints = false
//          toggle.onTintColor = K.brandRed
//          row.addArrangedSubview(toggle)
//          return row
//        }()
//        stack.addArrangedSubview(row)
//      }
//    }
//  }
// }
//
// extension OrderItemViewHeader {
//  private func setOptions(item: PFMenuItem) {
//    if item.chickenStyle {
//      let chickenOptions = OrderOptionsView(item: item, category: .chickenStyle)
//      stack.addArrangedSubview(chickenOptions)
//    }
//    if item.tempOption {
//      let tempOptions = OrderOptionsView(item: item, category: .tempOption)
//      stack.addArrangedSubview(tempOptions)
//    }
//    if item.dressingChoice {
//      let dressingOptions = OrderOptionsView(item: item, category: .dressingChoice)
//      stack.addArrangedSubview(dressingOptions)
//    }
//    if item.sides != nil {
//      let sidesOptions = OrderOptionsView(item: item, category: .sides)
//      stack.addArrangedSubview(sidesOptions)
//    }
//    if item.modifications != nil {
//      let modificationOptions = OrderOptionsView(item: item, category: .modifications)
//      stack.addArrangedSubview(modificationOptions)
//    }
//    if item.extraSauces {
//      let extraSauceOptions = OrderOptionsView(item: item, category: .extraSauces)
//      stack.addArrangedSubview(extraSauceOptions)
//    }
//  }
// }
