//
//  OptionsViewControllerv2.swift
//  PartyFowl
//
//  Created by Logan Melton on 7/5/23.
//

import UIKit

class OptionsViewController: UIViewController {
  var optionsView: OptionViewStack!
  var menuItem: PFMenuItem!
  var options: PFMenuItemOptions!
  var choices: [String] = []

  var itemToOrder = PFItemOrder()
  var chickenStyle: PFChickenStyle?
  var dressingChoice: PFDressingOption?
  var sides: String?
  var tempOption: PFTempOption?
  var modifications: [String]?
  var extraSauces: [[String: Int]]?

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                        style: .done,
                                                        target: self,
                                                        action: #selector(dismissView))
  }

  convenience init(menuItem: PFMenuItem!, options: PFMenuItemOptions!) {
    self.init()
    self.menuItem = menuItem
    self.options = options
    setOptionValues(for: options)
    styleView()
    fillStack()
  }
}

extension OptionsViewController {
  private func styleView() {
    optionsView = OptionViewStack()
    optionsView.translatesAutoresizingMaskIntoConstraints = false

    view.addSubview(optionsView)
    NSLayoutConstraint.activate([
      optionsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      optionsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      optionsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      optionsView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}

extension OptionsViewController {
  /// Fills the OptionsView Stack with the correct UIControl based on choice category
  private func fillStack() {
    var tag = 0
    for choice in choices {
      switch options {
      case .chickenStyle,
          .dressingChoice,
          .sides,
          .tempOption:
          let row = ToggleRow()
          row.optionLabel.text = choice.uppercased()
          row.toggle.tag = tag
          row.toggle.addTarget(self, action: #selector(didMakeSingleSelection), for: .valueChanged)
          optionsView.stackView.addArrangedSubview(row)
      case .modifications:
        let row = ToggleRow()
        row.optionLabel.text = choice.uppercased()
        row.toggle.tag = tag
        row.toggle.addTarget(self, action: #selector(didMakeMultipleSelections), for: .valueChanged)
        optionsView.stackView.addArrangedSubview(row)
      case .extraSauces:
          let row = StepperRow()
          row.optionLabel.text = choice.uppercased()
          row.stepper.addTarget(self, action: #selector(didChangeQty), for: .valueChanged)
          optionsView.stackView.addArrangedSubview(row)
      case .none:
          print()
      }
      tag += 1
    }
    let addToOrderButton = UIButton(type: .system)
    addToOrderButton.translatesAutoresizingMaskIntoConstraints = false
    var config = UIButton.Configuration.plain()
    config.title = "Add To Order"
    config.baseBackgroundColor = .systemBackground
    config.baseForegroundColor = K.brandRed
    config.buttonSize = .large
    addToOrderButton.configuration = config
    addToOrderButton.addTarget(self, action: #selector(didAddToOrder), for: .touchUpInside)
    optionsView.stackView.addArrangedSubview(addToOrderButton)
  }
}

/// Sets the labels and controls for the selected options based on choice category
extension OptionsViewController {
  private func setOptionValues(for option: PFMenuItemOptions) {
    switch option {
    case .chickenStyle:
      for style in PFChickenStyle.allCases {
        choices.append(style.rawValue)
      }
    case .dressingChoice, .extraSauces:
      for dressing in PFDressingOption.allCases {
        choices.append(dressing.rawValue)
      }
    case .sides:
      guard let sides = menuItem.sides else { return }
      choices = sides
    case .modifications:
      guard let mods = menuItem.modifications else { return }
      choices = mods
    case .tempOption:
      for temp in PFTempOption.allCases {
        choices.append(temp.rawValue)
      }
    }
  }
}

extension OptionsViewController {
  /// Sets the UISwitches for the OptionViewStack to only allow one selection
  @objc
  func didMakeSingleSelection(_ sender: UISwitch) {
    let allRows = optionsView.stackView.arrangedSubviews
    for row in allRows {
    guard let row = row as? ToggleRow else { return }
      if row.toggle.tag != sender.tag && row.toggle.isOn {
        row.toggle.setOn(false, animated: true)
      } else if row.toggle.tag == sender.tag {
        guard let selection = row.optionLabel.text else { return }
        print(selection)
//        TODO: Need method to assign the selected value to their correct itemToOrder properties.
      }
    }
  }

  /// Sets the UISwitches for the OptionViewStack to allow multiple selections
  @objc
  func didMakeMultipleSelections(_ sender: UISwitch) {
    guard modifications != nil else { return }
  }

  /// Updates the label's text value to the stepper value, incrementing by 1 up or down.
  @objc
  func didChangeQty(_ sender: UIStepper) {
    guard let rows = optionsView.stackView.arrangedSubviews as? [StepperRow] else { return }
    for row in rows {
      row.countLabel.text = String(format: "%.0f", row.stepper.value)
    }
  }

  // Updates the menuItem's properties with the appropriate value(s).
  @objc
  func didAddToOrder() {
    if let chickenStyle = self.chickenStyle {
      itemToOrder.chickenStyle = chickenStyle
    }
    if let dressing = self.dressingChoice {
      itemToOrder.dressingChoice = dressing
    }
    if let side = sides {
      itemToOrder.side = side
    }
    if let mods = modifications {
      itemToOrder.modifications? += mods
    }
    print("Chicken Style: \(String(describing: itemToOrder.chickenStyle))")
    print("Dressing Choice: \(String(describing: itemToOrder.dressingChoice))")
    print("sides: \(String(describing: itemToOrder.side))")
    print("Modifications: \(String(describing: itemToOrder.modifications))")
    dismiss(animated: true)
  }
}

extension OptionsViewController {
  private func setItemValue(to value: PFMenuOption, for option: PFMenuItemOptions) {
    switch option {
    case .chickenStyle:
        break
    case .dressingChoice:
      break
    case .sides:
      break
    case .modifications:
      break
    case .tempOption:
      break
    default:
      break
    }
  }
}
