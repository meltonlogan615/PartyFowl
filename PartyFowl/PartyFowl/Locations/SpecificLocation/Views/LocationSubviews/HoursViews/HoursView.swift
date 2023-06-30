//
//  HoursView.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/2/23.
//

import UIKit

class HoursView: UIView {
  var hoursLabel: UILabel!
  var completeHoursStack: UIStackView!
  var mainHoursStack: UIStackView!

  override init(frame: CGRect) {
    super.init(frame: frame)
    styleHours()
    layoutHours()
    translatesAutoresizingMaskIntoConstraints = false
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension HoursView {
  private func styleHours() {
    hoursLabel = UILabel()
    hoursLabel.translatesAutoresizingMaskIntoConstraints = false
    hoursLabel.font = .boldSystemFont(ofSize: 22)
    hoursLabel.textColor = K.brandRed
    hoursLabel.text = "HOURS"

    completeHoursStack = UIStackView()
    completeHoursStack.translatesAutoresizingMaskIntoConstraints = false
    completeHoursStack.axis = .vertical
    completeHoursStack.spacing = 24
  }

  private func layoutHours() {
    addSubview(hoursLabel)
    NSLayoutConstraint.activate([
      hoursLabel.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 2),
      hoursLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
      hoursLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])

    addSubview(completeHoursStack)
    NSLayoutConstraint.activate([
      completeHoursStack.topAnchor.constraint(equalToSystemSpacingBelow: hoursLabel.bottomAnchor, multiplier: 2),
      completeHoursStack.leadingAnchor.constraint(equalTo: hoursLabel.leadingAnchor),
      completeHoursStack.trailingAnchor.constraint(equalTo: hoursLabel.trailingAnchor),
      completeHoursStack.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
}
