//
//  TableView-ScrollToTop.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/16/23.
//

import UIKit

extension UITableView {
  func scrollToTop() {
    let topRow = IndexPath(row: 0, section: 0)
    self.scrollToRow(at: topRow, at: .top, animated: true)
  }
}
