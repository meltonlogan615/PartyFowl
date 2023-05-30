//
//  TableView-PresentView.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/28/23.
//

import UIKit

extension UIViewController {
  func presentVC(named viewController: UIViewController) {
    let navVC = PFNavController(rootViewController: viewController)
    navVC.modalPresentationStyle = .fullScreen
    navVC.modalTransitionStyle = .flipHorizontal
    present(navVC, animated: true)

  }
}
