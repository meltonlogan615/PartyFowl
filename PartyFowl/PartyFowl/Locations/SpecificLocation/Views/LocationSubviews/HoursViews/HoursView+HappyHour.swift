//
//  HoursView+HappyHour.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/5/23.
//

import UIKit

extension HoursView {
  func setHappyHours(for location: PFLocation) {
    let happyhourSectionLabel = UILabel()
    happyhourSectionLabel.translatesAutoresizingMaskIntoConstraints = false
    happyhourSectionLabel.font = .boldSystemFont(ofSize: 17)
    happyhourSectionLabel.text = "Happy Hour"

    let happyhourLabel = UILabel()
    happyhourLabel.translatesAutoresizingMaskIntoConstraints = false
    happyhourLabel.text = location.happyHour

    let happyhourNotesLabel = UILabel()
    happyhourNotesLabel.translatesAutoresizingMaskIntoConstraints = false
    var noteText = String()
    guard let noteStrings = location.happyHourNotes else { return }
    for note in noteStrings {
      noteText.append(note)
    }
    happyhourNotesLabel.text = noteText

    let stack = UIStackView()
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .vertical
    stack.spacing = 2

    stack.addArrangedSubview(happyhourSectionLabel)
    stack.addArrangedSubview(happyhourLabel)
    stack.addArrangedSubview(happyhourNotesLabel)
    completeHoursStack.addArrangedSubview(stack)
  }
}
