//
//  HoursView+KidsEatFree.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/5/23.
//

import UIKit

extension HoursView {
  func setKidsHours(for location: PFLocation) {
    guard let kidsHours = location.kidsEatFree else { return }
    let stack: UIStackView = {
      let stack = UIStackView()
      stack.translatesAutoresizingMaskIntoConstraints = false
      stack.axis = .vertical
      stack.spacing = 2
      return stack
    }()
    let kidsHoursSectionLabel = UILabel()
    kidsHoursSectionLabel.translatesAutoresizingMaskIntoConstraints = false
    kidsHoursSectionLabel.font = .boldSystemFont(ofSize: 17)
    kidsHoursSectionLabel.text = "Kids Eat Free!"

    let kidsHoursLabel = UILabel()
    kidsHoursLabel.translatesAutoresizingMaskIntoConstraints = false
    kidsHoursLabel.numberOfLines = 0
    kidsHoursLabel.text = kidsHours
    stack.addArrangedSubview(kidsHoursSectionLabel)
    stack.addArrangedSubview(kidsHoursLabel)
    completeHoursStack.addArrangedSubview(stack)
  }
}
