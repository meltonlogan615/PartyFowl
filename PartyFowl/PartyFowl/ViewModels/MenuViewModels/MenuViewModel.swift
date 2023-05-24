//
//  MenuViewModel.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/9/23.
//

import UIKit

class MenuViewModel: PFViewModel {
  var view: UIView!
  var host: UIViewController!

  func attachViewAndController(view: UIView, host: UIViewController) {
    self.view = view
    self.host = host
  }
}
