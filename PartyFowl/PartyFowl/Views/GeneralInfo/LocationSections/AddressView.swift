//
//  AddressView.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/2/23.
//

import UIKit

class AddressView: UIView {
  var addressSectionLabel: UILabel!
  var addressLineLabel: UILabel!
  var cityStateZipLabel: UILabel!
  var phoneLabel: UILabel!

  override init(frame: CGRect) {
    super.init(frame: frame)
    styleAddress()
    layoutAddress()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension AddressView {
  private func styleAddress() {
    addressSectionLabel = UILabel()
    addressSectionLabel.translatesAutoresizingMaskIntoConstraints = false
    addressSectionLabel.textColor = K.brandRed
    addressSectionLabel.font = .boldSystemFont(ofSize: 22)
    addressSectionLabel.text = "ADDRESS"

    addressLineLabel = UILabel()
    addressLineLabel.translatesAutoresizingMaskIntoConstraints = false
    addressLineLabel.font = .boldSystemFont(ofSize: 17)

    cityStateZipLabel = UILabel()
    cityStateZipLabel.translatesAutoresizingMaskIntoConstraints = false
    cityStateZipLabel.font = .boldSystemFont(ofSize: 17)

    phoneLabel = UILabel()
    phoneLabel.translatesAutoresizingMaskIntoConstraints = false
    phoneLabel.font = .boldSystemFont(ofSize: 17)
  }

  private func layoutAddress() {
    addSubview(addressSectionLabel)
    NSLayoutConstraint.activate([
      addressSectionLabel.topAnchor.constraint(equalTo: topAnchor),
      addressSectionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
      addressSectionLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])

    addSubview(addressLineLabel)
    NSLayoutConstraint.activate([
      addressLineLabel.topAnchor.constraint(equalToSystemSpacingBelow: addressSectionLabel.bottomAnchor, multiplier: 1),
      addressLineLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
      addressLineLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])

    addSubview(cityStateZipLabel)
    NSLayoutConstraint.activate([
      cityStateZipLabel.topAnchor.constraint(equalTo: addressLineLabel.bottomAnchor),
      cityStateZipLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
      cityStateZipLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])

    addSubview(phoneLabel)
    NSLayoutConstraint.activate([
      phoneLabel.topAnchor.constraint(equalToSystemSpacingBelow: cityStateZipLabel.bottomAnchor, multiplier: 1),
      phoneLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
      phoneLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
      phoneLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }

  func setAddress(for location: PFLocation) {
    addressLineLabel.text = location.streetAddress
    cityStateZipLabel.text = "\(location.city), \(location.state) \(location.zip)"
    phoneLabel.text = location.phone
  }
}
