//
//  UsableStack.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/1/23.
//

import UIKit

class UsableStack: UIView {
  var scrollView: UIScrollView!
  var contentView: UIView!
  var stackView: UIStackView!

  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
    styleAndLayoutStack()
  }
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension UsableStack {
  private func styleAndLayoutStack() {
    scrollView = UIScrollView()
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    scrollView.bounces = true
    scrollView.backgroundColor = .blue

    contentView = UIView()
    contentView.translatesAutoresizingMaskIntoConstraints = false
    contentView.backgroundColor = .green

    stackView = UIStackView()
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.backgroundColor = .yellow

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
      contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
      contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
      contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor)
    ])

    contentView.addSubview(stackView)
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
      stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
    ])
  }
}
