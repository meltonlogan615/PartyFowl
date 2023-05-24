//
//  HoursView+MainHours.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/5/23.
//

import UIKit

extension HoursView {
  func setHours(for location: PFLocation) {
    let mainHoursStack = UIStackView()
    mainHoursStack.translatesAutoresizingMaskIntoConstraints = false
    mainHoursStack.axis = .vertical
    mainHoursStack.spacing = 2

    let effectiveHoursLabel = UILabel()
    effectiveHoursLabel.translatesAutoresizingMaskIntoConstraints = false
    effectiveHoursLabel.font = .boldSystemFont(ofSize: 17)
    effectiveHoursLabel.text = "Hours - Effective \(location.hoursEffectiveDate)"
    mainHoursStack.addArrangedSubview(effectiveHoursLabel)

    if location.hoursFriday == location.hoursMonday {
      let hoursLabel = UILabel()
      hoursLabel.translatesAutoresizingMaskIntoConstraints = false
      hoursLabel.text = "Mon-Fri \(location.hoursMonday)"
      mainHoursStack.addArrangedSubview(hoursLabel)
      print(location.hoursMonday, location.hoursFriday)
    } else {
      let monThursHoursLabel = UILabel()
      monThursHoursLabel.translatesAutoresizingMaskIntoConstraints = false
      monThursHoursLabel.text = "Mon-Thur \(location.hoursMonday)"
      mainHoursStack.addArrangedSubview(monThursHoursLabel)

      let fridayHoursLabel = UILabel()
      fridayHoursLabel.text = "Fri \(location.hoursFriday)"
      mainHoursStack.addArrangedSubview(fridayHoursLabel)
    }
    let weekendHoursLabel = UILabel()
    weekendHoursLabel.translatesAutoresizingMaskIntoConstraints = false
    weekendHoursLabel.text = "Sat-Sun \(location.hoursSaturday)"
    mainHoursStack.addArrangedSubview(weekendHoursLabel)

    if location.hoursNotes != nil, let hoursDisclaimer = location.hoursNotes {
      guard let disclaimerText = hoursDisclaimer.data(using: .utf8) else { return }
      let attributedDisclaimer = try? NSMutableAttributedString(data: disclaimerText,
                                                                options: [
                                                                  .documentType: NSAttributedString.DocumentType.html
                                                                ],
                                                                documentAttributes: nil)
      guard let count = attributedDisclaimer?.length else { return }
      attributedDisclaimer?.addAttributes(
        [.foregroundColor: K.brandRed!,
         .font: UIFont.italicSystemFont(ofSize: 17)
        ],
        range: NSRange(location: 0, length: count))
      let disclaimerLabel = UILabel()
      disclaimerLabel.translatesAutoresizingMaskIntoConstraints = false
      disclaimerLabel.textColor = K.brandRed
      disclaimerLabel.numberOfLines = 0
      disclaimerLabel.attributedText = attributedDisclaimer
      mainHoursStack.addArrangedSubview(disclaimerLabel)
      completeHoursStack.addArrangedSubview(mainHoursStack)
    }
  }
}
