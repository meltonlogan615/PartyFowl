//
//  HoursView+Brunch.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/5/23.
//

import UIKit

extension HoursView {
  func setBrunchHours(for location: PFLocation) {
    let brunchLabel = UILabel()
    brunchLabel.translatesAutoresizingMaskIntoConstraints = false
    brunchLabel.font = .boldSystemFont(ofSize: 17)
    brunchLabel.text = "Weekend Brunch:"

    let brunchHoursLabel = UILabel()
    var brunchHours = String()
    if location.brunchFriday != nil {
      brunchHours = "Fri, Sat, & Sun \(location.brunchSaturday) 🥂"
    } else {
      brunchHours = "Sat-Sun \(location.brunchSaturday) 🥂"
    }
    brunchHoursLabel.text = brunchHours

    let brunchSpecialLabel = UILabel()
    brunchSpecialLabel.textColor = K.brandRed

    let brunchStack = UIStackView()
    brunchStack.translatesAutoresizingMaskIntoConstraints = false
    brunchStack.axis = .vertical
    brunchStack.spacing = 2
    brunchStack.addArrangedSubview(brunchLabel)
    brunchStack.addArrangedSubview(brunchHoursLabel)
    completeHoursStack.addArrangedSubview(brunchStack)
  }
}
