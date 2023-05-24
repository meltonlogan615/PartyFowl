//
//  AboutUsView.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/1/23.
//
//  swiftlint: disable line_length

import UIKit

class AboutUsView: UIView {
  var headerImage: UIImageView!
  var secondaryImage: UIImageView!
  var allAboutLabel: UILabel!
  var aboutText: UILabel!
  var likeHot: UILabel!
  var aboutHot: UILabel!

  override init(frame: CGRect) {
    super.init(frame: frame)
    styleAbout()
    layoutAbout()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension AboutUsView {
  private func styleAbout() {
    headerImage = UIImageView()
    headerImage.translatesAutoresizingMaskIntoConstraints = false
    secondaryImage = UIImageView()
    secondaryImage.translatesAutoresizingMaskIntoConstraints = false

    allAboutLabel = UILabel()
    allAboutLabel.translatesAutoresizingMaskIntoConstraints = false
    allAboutLabel.font = UIFont(name: "Helvetica-Bold", size: 32)
    allAboutLabel.numberOfLines = 0
    allAboutLabel.textColor = K.brandRed
    allAboutLabel.text = "SO, WHAT'S THIS\nPLACE ALL ABOUT?"

    aboutText = UILabel()
    aboutText.translatesAutoresizingMaskIntoConstraints = false
    aboutText.font = .preferredFont(forTextStyle: .body)
    aboutText.textColor = .label
    aboutText.numberOfLines = 0
    aboutText.text = """
Specializing in Nashville Hot Chicken, local beer, Boozy Slushies, and Brunch, Party Fowl offers diners a one-of-a-kind experience at all six of our locations.  The menu, created by Executive Chef Bart Pickens, includes a number of hot chicken dishes with heat levels ranging from Southern Fried to “Poultrygeist,” as well as creative spins on the classics. Party Fowl offers local beers on draft and is home to the original Boozy Slushies. With wall-to-wall large-screen TVs, and a brunch like nothing else, there is something for everyone at Party Fowl. \n\nOwners Austin Smith and Nick Jacobson opened the restaurant with the hopes of bringing together the best of Nashville under one roof by combining great food, great drinks and a great experience. With locations in the heart of Downtown Nashville, Donelson, Cool Springs, Murfreesboro, Chattanooga, and most recently, Destin, FL, you're never far from the Party.
"""

    likeHot = UILabel()
    likeHot.translatesAutoresizingMaskIntoConstraints = false
    likeHot.font = UIFont(name: "Helvetica-Bold", size: 32)
    likeHot.numberOfLines = 0
    likeHot.textColor = K.brandRed
    likeHot.text = "YOU LIKE IT HOT?"

    aboutHot = UILabel()
    aboutHot.translatesAutoresizingMaskIntoConstraints = false
    aboutHot.font = .preferredFont(forTextStyle: .body)
    aboutHot.textColor = .label
    aboutHot.numberOfLines = 0
    aboutHot.text = """
Nashville Hot Chicken is a dish unlike anything else. Signature to Music City, it's most often composed of bone-in chicken that's been breaded, fried and liberally seasoned with a signature blend of spices. But be warned, it's called HOT for a reason! When we hand-bread and fry our chicken, it comes out of the frier and dipped into the heat level of your choosing, causing the spice to bloom so you get the delicious heat and flavor that Nashville Hot Chicken lovers crave.\n\nIf you’re new to Nashville Hot Chicken, think twice before you order. We usually recommend beginning at Medium for traditional spice-lovers, and even our Mild has an extra kick! You are always welcome to go Southern Fried (no heat) and get your sauce on the side if you’re exercising extra caution. For you daredevils, our “Poultrygeist” falls at about a 2.2 million on the Scoville Heat Scale, complete with cayenne, pure habanero, ghost, scorpion, and Carolina reaper pepper.\n\nHere at Party Fowl, you'll not only find a full section of Nashville Hot favorites on our menu, but creative ways to incorporate this signature flavor throughout your meal - be it for lunch, dinner or even brunch!
"""
  }

  private func layoutAbout() {
    let stack: UsableStack = {
      let stack = UsableStack()
      stack.translatesAutoresizingMaskIntoConstraints = false
      stack.stackView.addArrangedSubview(allAboutLabel)
      stack.stackView.addArrangedSubview(aboutText)
      stack.stackView.addArrangedSubview(likeHot)
      stack.stackView.addArrangedSubview(aboutHot)
      return stack
    }()

    addSubview(stack)
    NSLayoutConstraint.activate([
      stack.topAnchor.constraint(equalTo: topAnchor),
      stack.leadingAnchor.constraint(equalTo: leadingAnchor),
      stack.trailingAnchor.constraint(equalTo: trailingAnchor),
      stack.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
}
