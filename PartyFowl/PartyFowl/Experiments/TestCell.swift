//
//  TestCell.swift
//  PartyFowl
//
//  Created by Logan Melton on 6/29/23.
//

import UIKit

class TestCell: UITableViewCell {
  static let reuseID = "testCell"
  var optionLabel: UILabel!
  var optionControl: UIView!

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: TestCell.reuseID)
    styleCell()
    layoutCell()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension TestCell {
  private func styleCell() {
    optionLabel = UILabel()
    optionLabel.translatesAutoresizingMaskIntoConstraints = false
    optionLabel.font = .preferredFont(forTextStyle: .headline)

    optionControl = UIView()
    optionControl.translatesAutoresizingMaskIntoConstraints = false
  }

  private func layoutCell() {
    contentView.addSubview(optionLabel)
    NSLayoutConstraint.activate([
      optionLabel.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1),
      optionLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 1),
      contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: optionLabel.bottomAnchor, multiplier: 1)
    ])
  }
}

extension TestCell {
  func setControl(to control: OptionControl) {
    var option = UIView()
    switch control {
    case .toggle:
      option = setToggle()
    case .stepper:
      option = setStepper()
    }
    optionControl.addSubview(option)
    NSLayoutConstraint.activate([
      option.topAnchor.constraint(equalTo: optionControl.topAnchor),
      option.leadingAnchor.constraint(equalTo: optionControl.leadingAnchor),
      option.trailingAnchor.constraint(equalTo: optionControl.trailingAnchor),
      option.bottomAnchor.constraint(equalTo: optionControl.bottomAnchor)
    ])
    contentView.addSubview(optionControl)
    NSLayoutConstraint.activate([
      optionControl.topAnchor.constraint(equalTo: optionLabel.topAnchor),
      contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: optionControl.trailingAnchor, multiplier: 2),
      optionControl.bottomAnchor.constraint(equalTo: optionLabel.bottomAnchor)
    ])
  }

  private func setToggle() -> UISwitch {
    let toggle = UISwitch()
    toggle.translatesAutoresizingMaskIntoConstraints = false
    toggle.onTintColor = K.brandRed
    return toggle
  }

  private func setStepper() -> UIView {
    let stepper = UIStepper()
    stepper.translatesAutoresizingMaskIntoConstraints = false
    stepper.value = 0
    stepper.stepValue = 1
    let counter = UILabel()
    counter.translatesAutoresizingMaskIntoConstraints = false
    counter.text = String(format: "%.0f", stepper.value)
    let stack: UIStackView = {
      let stack = UIStackView(arrangedSubviews: [counter, stepper])
      stack.axis = .horizontal
      stack.spacing = 4
      return stack
    }()
    return stack
  }
}
