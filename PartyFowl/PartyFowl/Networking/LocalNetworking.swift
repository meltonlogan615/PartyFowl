//
//  LocalNetworking.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/2/23.
//

import Foundation

class LocalNetworking {
  let decoder = JSONDecoder()

  func readLocal(fileName: String) -> [PFLocation]? {
    guard let path = Bundle.main.url(forResource: fileName, withExtension: "json") else { return [] }
    do {
      let data = try Data(contentsOf: path)
      let decoded = try decoder.decode([PFLocation].self, from: data)
      return decoded
    } catch {
      print("error: \(error)")
    }
    return nil
  }

  func getMenu(for fileName: String) -> [PFMenuResults]? {
    guard let path = Bundle.main.url(forResource: fileName, withExtension: "json") else { return nil }
    do {
      let data = try Data(contentsOf: path)
      let decoded = try decoder.decode([PFMenuResults].self, from: data)
      return decoded
    } catch {
      print("error: \(error)")
    }
    return nil
  }
}
