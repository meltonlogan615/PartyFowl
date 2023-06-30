//
//  StatusBar.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/3/23.
//

import UIKit

class StatusBar {
  static func setColor(for view: UIView) {
    if #available(iOS 13.0, *) {
      let app = UIApplication.shared
      let statusBarHeight: CGFloat = app.statusBarFrame.size.height
      let statusbarView = UIView()
      statusbarView.backgroundColor = UIColor.black
      view.addSubview(statusbarView)
      statusbarView.layer.zPosition = 10

      statusbarView.translatesAutoresizingMaskIntoConstraints = false
      statusbarView.heightAnchor
        .constraint(equalToConstant: statusBarHeight).isActive = true
      statusbarView.widthAnchor
        .constraint(equalTo: view.widthAnchor, multiplier: 1.0).isActive = true
      statusbarView.topAnchor
        .constraint(equalTo: view.topAnchor).isActive = true
      statusbarView.centerXAnchor
        .constraint(equalTo: view.centerXAnchor).isActive = true

    } else {
      let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView
      statusBar?.backgroundColor = UIColor.red
    }
  }
}
