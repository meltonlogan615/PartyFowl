//
//  AppDelegate.swift
//  PartyFowl
//
//  Created by Logan Melton on 4/29/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.makeKeyAndVisible()
    window?.backgroundColor = .systemBackground

    let navController = PFNavController(rootViewController: AllLocationsViewController())
    window?.rootViewController = navController
    return true
  }
}
