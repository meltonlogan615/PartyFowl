//
//  MenuOptions.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/9/23.
//

import UIKit

class MenuOptions: UIView {
  var scrollView: UIScrollView!
  var contentView: UIView!
  var stack: UIStackView!
  let options = PFMenuCategory.allCases
  var selectedIndex: Int = 0

  override init(frame: CGRect) {
    super.init(frame: frame)
    styleOptions()
    layoutOptions()
    addOptions()
    updatedSelectedButtonColor(at: selectedIndex)
  }

  required init?(coder: NSCoder) {
    fatalError("No Coder")
  }
}

extension MenuOptions {
  private func styleOptions() {
    scrollView = UIScrollView()
    scrollView.translatesAutoresizingMaskIntoConstraints = false

    contentView = UIView()
    contentView.translatesAutoresizingMaskIntoConstraints = false

    stack = UIStackView()
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .horizontal
    stack.spacing = 2
    stack.distribution = .fillProportionally
  }

  private func layoutOptions() {
    addSubview(scrollView)
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: topAnchor),
      scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])

    scrollView.addSubview(contentView)
    NSLayoutConstraint.activate([
      contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
    ])

    contentView.addSubview(stack)
    NSLayoutConstraint.activate([
      stack.topAnchor.constraint(equalTo: contentView.topAnchor),
      stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }
}

extension MenuOptions {
  private func addOptions() {
    var optionTag = 0
    for option in options {
      let optionButton = UIButton(type: .custom)
      optionButton.translatesAutoresizingMaskIntoConstraints = false
      var config = UIButton.Configuration.plain()
      config.titlePadding = 5
      optionButton.configuration = config
      optionButton.setTitle(option.rawValue, for: .normal)
      optionButton.tag = optionTag
//      optionButton.addTarget(self, action: #selector(optionSelected), for: .touchUpInside)
      stack.addArrangedSubview(optionButton)
      optionTag += 1
    }
  }

  @objc
  func optionSelected(_ sender: UIButton) {
    selectedIndex = sender.tag
    updatedSelectedButtonColor(at: sender.tag)
//    menu.tableView.reloadData()
//    menu.tableView.scrollToTop()
    scrollView.scrollToCenter(sender)
  }

  func updatedSelectedButtonColor(at index: Int) {
    selectedIndex = index
    for view in stack.arrangedSubviews {
      view.backgroundColor = .systemBackground
      view.tintColor = K.brandRed
    }
    guard let button = stack.arrangedSubviews[selectedIndex] as? UIButton else {
      return
    }
    button.backgroundColor = K.brandRed
    button.tintColor = .systemBackground
  }
}
