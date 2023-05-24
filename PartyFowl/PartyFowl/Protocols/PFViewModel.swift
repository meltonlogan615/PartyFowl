//
//  PFViewModel.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/10/23.
//

import UIKit

protocol PFViewModel {
  var view: UIView! { get set }
  var host: UIViewController! { get set }
  func attachViewAndController(view: UIView, host: UIViewController)
}
