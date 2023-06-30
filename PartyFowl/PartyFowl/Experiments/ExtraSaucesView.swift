//  //
//  //  ExtraSaucesView.swift
//  //  PartyFowl
//  //
//  //  Created by Logan Melton on 5/31/23.
//  //
//
//  import UIKit
//
//  class ExtraSaucesView: UIView {
//    var displayButton: UIButton!
//    var rowStack: UIStackView!
//
//    override init(frame: CGRect) {
//      super.init(frame: frame)
//      styleSauces()
//      layoutSauces()
//    }
//
//    required init?(coder: NSCoder) {
//      fatalError("No Extra Sauce Coder")
//    }
//
//    convenience init(with item: PFMenuItem) {
//      self.init()
//      setOptions(for: item)
//    }
//  }
//
//  extension ExtraSaucesView {
//    private func styleSauces() {
//      displayButton = UIButton()
//      displayButton.translatesAutoresizingMaskIntoConstraints = false
//      var config = UIButton.Configuration.plain()
//      config.baseForegroundColor = K.brandRed
//      config.title = "Extra Sauces"
//      displayButton.configuration = config
//
//      rowStack = UIStackView()
//      rowStack.translatesAutoresizingMaskIntoConstraints = false
//      rowStack.axis = .vertical
//      rowStack.isHidden = true
//    }
//
//    private func layoutSauces() {
//      addSubview(displayButton)
//      NSLayoutConstraint.activate([
//        displayButton.topAnchor.constraint(equalTo: topAnchor),
//        displayButton.leadingAnchor.constraint(equalTo: leadingAnchor)
//      ])
//
//      if !rowStack.isHidden {
//        addSubview(rowStack)
//        NSLayoutConstraint.activate([
//          rowStack.topAnchor.constraint(equalToSystemSpacingBelow: displayButton.bottomAnchor, multiplier: 1),
//          rowStack.leadingAnchor.constraint(equalTo: leadingAnchor),
//          rowStack.trailingAnchor.constraint(equalTo: trailingAnchor),
//          rowStack.bottomAnchor.constraint(equalTo: bottomAnchor)
//        ])
//      } else {
//        displayButton.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
//      }
//    }
//  }
//
//  extension ExtraSaucesView {
//    private func setOptions(for item: PFMenuItem) {
//      if item.extraSauces {
//        for sauce in DressingOption.allCases {
//          let label = UILabel()
//          label.translatesAutoresizingMaskIntoConstraints = false
//          label.text = sauce.rawValue.capitalized
//
//          let stepper = UIStepper()
//          stepper.translatesAutoresizingMaskIntoConstraints = false
//          stepper.value = 0
//          stepper.stepValue = 1
//
//          let counter = UILabel()
//          counter.translatesAutoresizingMaskIntoConstraints = false
//          counter.text = String(format: "%.0f", stepper.value)
//
//          let innerStack = UIStackView(arrangedSubviews: [stepper, counter])
//          innerStack.translatesAutoresizingMaskIntoConstraints = false
//          innerStack.axis = .horizontal
//          innerStack.spacing = 8
//          innerStack.distribution = .fillEqually
//
//          let outerStack = UIStackView(arrangedSubviews: [label, innerStack])
//          outerStack.translatesAutoresizingMaskIntoConstraints = false
//          outerStack.axis = .horizontal
//          outerStack.distribution = .fillEqually
//
//          rowStack.addArrangedSubview(outerStack)
//        }
//      }
//    }
//  }
