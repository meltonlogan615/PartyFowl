//
//  PFViewController.swift
//  PartyFowl
//
//  Created by Logan Melton on 6/29/23.
//
//  swiftlint: disable force_cast

import UIKit

class PFViewController<T: UIView>: UIViewController {
  public var rootView: T {
    return view as! T
  }

  override open func loadView() {
    self.view = T()
    self.view.backgroundColor = .systemBackground
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back",
                                                       image: UIImage(systemName: "chevron.left"),
                                                       target: self,
                                                       action: #selector(dismissView))
  }
}
