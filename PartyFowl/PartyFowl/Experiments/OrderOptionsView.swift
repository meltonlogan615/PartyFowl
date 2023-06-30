//  //
//  //  OrderOptionsView.swift
//  //  PartyFowl
//  //
//  //  Created by Logan Melton on 5/31/23.
//  //
//
//  import UIKit
//
//  class OrderOptionsView: UIView {
//    var category: PFMenuItemOptions!
//    var displayButton: UIButton!
//    var config = UIButton.Configuration.plain()
//    var stack: UIStackView!
//
//    override init(frame: CGRect) {
//      super.init(frame: frame)
//      styleOption()
//      layoutOption()
//    }
//
//    required init?(coder: NSCoder) {
//      fatalError("No Order Option Coder")
//    }
//
//    convenience init(item: PFMenuItem, category: PFMenuItemOptions) {
//      self.init()
//      self.category = category
//  //    setOptions(menuItem: item, category: category)
//    }
//  }
//
//  extension OrderOptionsView {
//    private func styleOption() {
//      displayButton = UIButton()
//      displayButton.translatesAutoresizingMaskIntoConstraints = false
//
//      stack = UIStackView()
//      stack.translatesAutoresizingMaskIntoConstraints = false
//      stack.axis = .vertical
//      stack.spacing = 16
//      stack.isHidden = false
//    }
//
//    private func layoutOption() {
//      addSubview(displayButton)
//      NSLayoutConstraint.activate([
//        displayButton.topAnchor.constraint(equalTo: topAnchor),
//        displayButton.leadingAnchor.constraint(equalTo: leadingAnchor)
//      ])
//
//      if !stack.isHidden {
//        addSubview(stack)
//        NSLayoutConstraint.activate([
//          stack.topAnchor.constraint(equalToSystemSpacingBelow: displayButton.bottomAnchor, multiplier: 1),
//          stack.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
//          trailingAnchor.constraint(equalToSystemSpacingAfter: stack.trailingAnchor, multiplier: 2),
//          stack.bottomAnchor.constraint(equalTo: bottomAnchor)
//        ])
//      } else {
//        displayButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
//      }
//    }
//  }
//
//  extension OrderOptionsView {
//    func setOptions(menuItem: PFMenuItem, category: PFMenuItemOptions) {
//      switch category {
//      case .chickenStyle:
//        if menuItem.chickenStyle {
//          setButtonTitle(category: .chickenStyle)
//          for style in PFChickenStyle.allCases {
//            let row = assembleRow(label: setLabel(title: style.rawValue),
//                                  control: setSwitch())
//            stack.addArrangedSubview(row)
//          }
//        }
//      case .dressingChoice:
//        if menuItem.dressingChoice {
//          setButtonTitle(category: .dressingChoice)
//          for style in DressingOption.allCases {
//            let row = assembleRow(label: setLabel(title: style.rawValue),
//                                  control: setSwitch())
//            stack.addArrangedSubview(row)
//          }
//        }
//      case .sides:
//        if let sides = menuItem.sides {
//          setButtonTitle(category: .sides)
//          for side in sides {
//            let row = assembleRow(label: setLabel(title: side),
//                                  control: setSwitch())
//            stack.addArrangedSubview(row)
//          }
//        }
//      case .extraSauces:
//        if menuItem.extraSauces {
//          setButtonTitle(category: .extraSauces)
//          for sauce in DressingOption.allCases {
//            let row = assembleRow(label: setLabel(title: sauce.rawValue),
//                                  control: setSwitch())
//            stack.addArrangedSubview(row)
//          }
//        }
//      case .modifications:
//        if let mods = menuItem.modifications {
//          setButtonTitle(category: .modifications)
//          for mod in mods {
//            let row = assembleRow(label: setLabel(title: mod),
//                                  control: setSwitch())
//            stack.addArrangedSubview(row)
//          }
//        }
//      case .tempOption:
//        if menuItem.tempOption {
//          setButtonTitle(category: .tempOption)
//          for option in PFTempOption.allCases {
//            let row = assembleRow(label: setLabel(title: option.rawValue),
//                                  control: setSwitch())
//            stack.addArrangedSubview(row)
//          }
//        }
//      }
//    }
//
//    private func setButtonTitle(category: PFMenuItemOptions) {
//      config.baseForegroundColor = K.brandRed
//      config.title = category.rawValue.capitalized
//      displayButton.configuration = config
//    }
//
//    private func assembleRow(label: UILabel, control: UIView) -> UIStackView {
//      let stack = UIStackView(arrangedSubviews: [label, control])
//      stack.translatesAutoresizingMaskIntoConstraints = false
//      stack.axis = .horizontal
//      stack.distribution = .equalSpacing
//      stack.insetsLayoutMarginsFromSafeArea = true
//      return stack
//    }
//
//    private func setLabel(title: String) -> UILabel {
//      let label = UILabel()
//      label.translatesAutoresizingMaskIntoConstraints = false
//      label.text = title.capitalized
//      label.backgroundColor = .yellow
//      return label
//    }
//
//    private func setSwitch() -> UISwitch {
//      let toggle = UISwitch()
//      toggle.translatesAutoresizingMaskIntoConstraints = false
//      toggle.onTintColor = K.brandRed
//      return toggle
//    }
//
//    private func setStepper() -> UIView {
//      let stepper = UIStepper()
//      stepper.translatesAutoresizingMaskIntoConstraints = false
//      stepper.value = 0
//      stepper.stepValue = 1
//
//      let counter = UILabel()
//      counter.translatesAutoresizingMaskIntoConstraints = false
//      counter.text = String(format: "%.0f", stepper.value)
//  //    let innerStack = UIStackView(arrangedSubviews: [counter, stepper])
//  //    innerStack.translatesAutoresizingMaskIntoConstraints = false
//  //    innerStack.axis = .horizontal
//  //    innerStack.distribution = .fillProportionally
//  //    innerStack.backgroundColor = .cyan
//
//      let stepperView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(counter)
//        NSLayoutConstraint.activate([
//          counter.topAnchor.constraint(equalTo: view.topAnchor),
//          counter.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//          counter.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//        ])
//
//        view.addSubview(stepper)
//        NSLayoutConstraint.activate([
//          stepper.topAnchor.constraint(equalTo: counter.topAnchor),
//          stepper.leadingAnchor.constraint(equalToSystemSpacingAfter: counter.trailingAnchor, multiplier: 2),
//          stepper.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//          stepper.bottomAnchor.constraint(equalTo: counter.bottomAnchor)
//        ])
//        return view
//      }()
//
//      return stepperView
//    }
//  }
