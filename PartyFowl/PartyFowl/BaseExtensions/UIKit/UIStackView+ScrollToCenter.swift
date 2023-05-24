//
//  UIStackView+ScrollToCenter.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/16/23.
//

import UIKit

extension UIScrollView {
  func scrollToCenter(_ targetView: UIView) {
    let viewPortWidth = self.frame.width - self.contentInset.right
    let posInViewport = targetView.frame.origin.x + (targetView.frame.width / 2) - self.contentOffset.x
    let posDelta = (viewPortWidth / 2) - posInViewport
    var newXOffset = self.contentOffset.x - posDelta

    if newXOffset < 0 {
      newXOffset = 0
    } else if newXOffset > self.subviews[0].frame.width - viewPortWidth {
      newXOffset = self.subviews[0].frame.width - viewPortWidth
    }

    self.setContentOffset(CGPoint(x: newXOffset, y: self.contentOffset.y), animated: true)
  }
}
