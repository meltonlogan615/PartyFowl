//
//  OptionViewStack.swift
//  PartyFowl
//
//  Created by Logan Melton on 7/5/23.
//

import UIKit

class OptionViewStack: UIView {

  var scrollView: UIScrollView!
  var contentView: UIView!
  var stackView: UIStackView!

  override init(frame: CGRect) {
    super.init(frame: frame)
    styleOrderView()
    layoutOrderView()
    backgroundColor = .systemBackground
  }

  required init?(coder: NSCoder) {
    fatalError("Coder no Coding")
  }
}

extension OptionViewStack {
  private func styleOrderView() {
    scrollView = UIScrollView()
    scrollView.translatesAutoresizingMaskIntoConstraints = false

    contentView = UIView()
    contentView.translatesAutoresizingMaskIntoConstraints = false

    stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.axis = .vertical
  }

  private func layoutOrderView() {
    addSubview(scrollView)
    NSLayoutConstraint.activate([
      scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
      scrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
      scrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
      scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
    ])

    scrollView.addSubview(contentView)
    NSLayoutConstraint.activate([
      contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
      contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
      contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
    ])

    contentView.addSubview(stackView)
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
      stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }
}

extension OptionViewStack {
  func fillStack(with options: [String]) {
    for option in options {
    let row = ToggleRow()
    row.translatesAutoresizingMaskIntoConstraints = false
      row.optionLabel.text = option
      stackView.addArrangedSubview(row)
    }
  }
}
