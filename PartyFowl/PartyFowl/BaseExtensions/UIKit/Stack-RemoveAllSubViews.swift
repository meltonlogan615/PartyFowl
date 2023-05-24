//
//  Stack-RemoveAllSubViews.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/10/23.
//

import UIKit

extension UIStackView {
  func removeAllArrangedSubViews() {
    let removedSubViews = arrangedSubviews.reduce([]) { (allSubviews, subview) -> [UIView] in
      self.removeArrangedSubview(subview)
      return allSubviews + [subview]
    }
    NSLayoutConstraint.deactivate(removedSubViews.flatMap({ $0.constraints }))
    removedSubViews.forEach({ $0.removeFromSuperview() })
  }
}
