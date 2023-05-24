//
//  LocationCell.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/2/23.
//

import UIKit

class LocationCell: UICollectionViewCell {
  static let reuseID = "locationCell"
  var locationImage: UIImageView!
  var locationName: UILabel!
  var locationDetail: UILabel!

  override init(frame: CGRect) {
    super.init(frame: frame)
    styleCell()
    layoutCell()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func configureCell(with location: PFLocation) {
    locationImage.image = UIImage(named: location.name.lowercased())
    locationName.text = location.name.uppercased()
    locationDetail.text = location.addressDescription
  }

  override func prepareForReuse() {
    locationImage.image = nil
    locationName.text = nil
    locationDetail.text = nil
  }
}

extension LocationCell {
  private func styleCell() {
    locationImage = UIImageView()
    locationImage.translatesAutoresizingMaskIntoConstraints = false
    locationImage.contentMode = .scaleToFill

    locationName = UILabel()
    locationName.translatesAutoresizingMaskIntoConstraints = false
    locationName.font = UIFont(name: "Helvetica-Bold", size: 36)
    locationName.textColor = .white
    locationName.textAlignment = .center

    locationDetail = UILabel()
    locationDetail.translatesAutoresizingMaskIntoConstraints = false
    locationDetail.font = .preferredFont(forTextStyle: .body)
    locationDetail.textColor = .white
    locationDetail.textAlignment = .center
  }

  private func layoutCell() {
    contentView.addSubview(locationImage)
    NSLayoutConstraint.activate([
      locationImage.topAnchor.constraint(equalTo: contentView.topAnchor),
      locationImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
      locationImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
      locationImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])

    contentView.addSubview(locationName)
    NSLayoutConstraint.activate([
      locationName.centerXAnchor.constraint(equalTo: locationImage.centerXAnchor),
      locationName.centerYAnchor.constraint(equalTo: locationImage.centerYAnchor),
      locationName.widthAnchor.constraint(equalTo: locationImage.widthAnchor),
      locationName.heightAnchor.constraint(equalToConstant: 42)
    ])

    contentView.addSubview(locationDetail)
    NSLayoutConstraint.activate([
      locationDetail.topAnchor.constraint(equalTo: locationName.bottomAnchor),
      locationDetail.leadingAnchor.constraint(equalTo: locationName.leadingAnchor),
      locationDetail.trailingAnchor.constraint(equalTo: locationName.trailingAnchor)
    ])
  }
}
