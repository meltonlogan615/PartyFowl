//
//  ItemOptionsViewController.swift
//  PartyFowl
//
//  Created by Logan Melton on 6/29/23.
//

import UIKit

class OptionsViewController: UIViewController {
  var table: OptionsTable!
  var menuItem: PFMenuItem!
  var options: PFMenuItemOptions!
  var choices: [String] = []

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done",
                                                        style: .done,
                                                        target: self,
                                                        action: #selector(dismissView))
  }

  convenience init(menuItem: PFMenuItem!, options: PFMenuItemOptions!) {
    self.init()
    self.menuItem = menuItem
    self.options = options
    setOptionValues(for: options)
    styleView()
  }
}

extension OptionsViewController {
  private func styleView() {
    table = OptionsTable()
    table.translatesAutoresizingMaskIntoConstraints = false
    table.table.dataSource = self

    view.addSubview(table)
    NSLayoutConstraint.activate([
      table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      table.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      table.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
      table.widthAnchor.constraint(equalTo: view.widthAnchor)
    ])
  }
}

extension OptionsViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return choices.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: OptionCell.reuseID,
                                                   for: indexPath) as? OptionCell else {
      return UITableViewCell()
    }
    cell.optionLabel.text = choices[indexPath.row].uppercased()
    switch options {
    case .chickenStyle:
      cell.setControl(to: .toggle)
    case .dressingChoice:
      cell.setControl(to: .toggle)
    case .sides:
      cell.setControl(to: .toggle)
    case .modifications:
      cell.setControl(to: .toggle)
    case .extraSauces:
      cell.setControl(to: .stepper)
    case .tempOption:
      cell.setControl(to: .toggle)
    case .none:
      print()
    }
    return cell
  }
}

extension OptionsViewController {
  private func setOptionValues(for option: PFMenuItemOptions) {
    switch option {
    case .chickenStyle:
      for style in PFChickenStyle.allCases {
        choices.append(style.rawValue)
      }
    case .dressingChoice, .extraSauces:
      for dressing in PFDressingOption.allCases {
        choices.append(dressing.rawValue)
      }
    case .sides:
      guard let sides = menuItem.sides else { return }
      choices = sides
    case .modifications:
      guard let mods = menuItem.modifications else { return }
      choices = mods
    case .tempOption:
      for temp in PFTempOption.allCases {
        choices.append(temp.rawValue)
      }
    }
  }
}
