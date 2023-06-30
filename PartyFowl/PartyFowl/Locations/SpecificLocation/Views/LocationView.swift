//
//  LocationView.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/1/23.
//

import UIKit

class LocationView: UIView {
  var scrollView = UIScrollView()
  var contentView = UIView()
  var stack = UIStackView()
  var locationLabel: UILabel!
  var buttonView: LocationButtonsView!
  var hoursView: HoursView!
  var eventsButton: ActionButton!
  var addressView: AddressView!
  var mapView: LocationMapView!

  override init(frame: CGRect) {
    super.init(frame: frame)
    styleLocation()
    layoutLocation()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension LocationView {
  private func styleLocation() {
    scrollView.translatesAutoresizingMaskIntoConstraints = false
    contentView.translatesAutoresizingMaskIntoConstraints = false
    contentView.backgroundColor = .systemBackground

    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .vertical
    stack.spacing = 16
    stack.distribution = .fillProportionally

    buttonView = LocationButtonsView()
    buttonView.translatesAutoresizingMaskIntoConstraints = false
    stack.addArrangedSubview(buttonView)

    hoursView = HoursView()
    hoursView.translatesAutoresizingMaskIntoConstraints = false
    stack.addArrangedSubview(hoursView)

    addressView = AddressView()
    addressView.translatesAutoresizingMaskIntoConstraints = false
    stack.addArrangedSubview(addressView)

    mapView = LocationMapView()
    mapView.translatesAutoresizingMaskIntoConstraints = false
    stack.addArrangedSubview(mapView)
  }

  private func layoutLocation() {
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
      contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
    ])

    contentView.addSubview(stack)
    NSLayoutConstraint.activate([
      stack.topAnchor.constraint(equalTo: contentView.topAnchor),
      stack.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 2),
      contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: stack.trailingAnchor, multiplier: 2),
      stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }
}
