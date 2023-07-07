//
//  TestVC.swift
//  PartyFowl
//
//  Created by Logan Melton on 5/30/23.
//

import UIKit

class TestVC: UIViewController {
  var item: PFMenuItem!
  var optionsTable: UITableView!
  var sectionCount: Int = 1
  var sections: [String] = []
  var expandedIndexSet: IndexSet = []

  override func viewDidLoad() {
    super.viewDidLoad()
    print("TESTVC")
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back",
                                                       image: UIImage(systemName: "chevron.left"),
                                                       target: self,
                                                       action: #selector(dismissView))
    setupSections(for: item)
    styleOrderView()
    layoutOrderView()
  }
}

extension TestVC {
  private func styleOrderView() {
    optionsTable = UITableView()
    optionsTable.translatesAutoresizingMaskIntoConstraints = false
    optionsTable.dataSource = self
    optionsTable.delegate = self
  }

  private func layoutOrderView() {
    view.addSubview(optionsTable)
    NSLayoutConstraint.activate([
      optionsTable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      optionsTable.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      optionsTable.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      optionsTable.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
}

extension TestVC: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sectionCount
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: ItemContainerCell.reuseID,
                                                   for: indexPath) as? ItemContainerCell else {
      return UITableViewCell()
    }

    cell.titleLabel.text = sections[indexPath.row]
    if expandedIndexSet.contains(indexPath.row) {
//      cell.stack.removeAllArrangedSubViews()
//      fillWithBullshit(cell: cell)
    } else {
//      cell.stack.options?.removeAll()
//      cell.stack.removeAllArrangedSubViews()
    }
    return cell
  }
}

extension TestVC {
//  private func fillWithBullshit(cell: UITableViewCell) {
//    for _ in 0 ..< 10 {
//      guard let cell = cell as? OptionContainerCell else { return }
//      let poop = OptionRow()
//      poop.translatesAutoresizingMaskIntoConstraints = false
//      poop.optionLabel.text = "poop"
//      poop.setControl(to: .stepper)
//      cell.stack.addArrangedSubview(poop)
//    }
//  }

  func setupSections(for item: PFMenuItem) {
    if item.chickenStyle { sectionCount += 1 }
    sections.append(PFMenuItemOptions.chickenStyle.rawValue.capitalized)
    if item.dressingChoice { sectionCount += 1 }
    sections.append(PFMenuItemOptions.dressingChoice.rawValue.capitalized)
    if item.sides != nil { sectionCount += 1}
    sections.append(PFMenuItemOptions.sides.rawValue.capitalized)
    if item.modifications != nil { sectionCount += 1 }
    sections.append(PFMenuItemOptions.modifications.rawValue.capitalized)
    if item.extraSauces { sectionCount += 1}
    sections.append(PFMenuItemOptions.extraSauces.rawValue.capitalized)
    if item.tempOption { sectionCount += 1}
    sections.append(PFMenuItemOptions.tempOption.rawValue.capitalized)
  }
}

extension TestVC: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let optionView = OptionsViewControllerOld(menuItem: item, options: .chickenStyle)
    let nav = UINavigationController(rootViewController: optionView)
    nav.modalPresentationStyle = .pageSheet
    nav.navigationBar.backgroundColor = .systemBackground
    optionView.title = sections[indexPath.row]
    if let sheet = nav.sheetPresentationController {
      sheet.detents = [.large()]
      sheet.prefersScrollingExpandsWhenScrolledToEdge = false
      sheet.largestUndimmedDetentIdentifier = .medium
    }
    present(nav, animated: true)
  }
//  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//    return UITableView.automaticDimension
//  }

//  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    tableView.deselectRow(at: indexPath, animated: true)
//    guard let cell = tableView.cellForRow(at: indexPath) else { return }
//    if expandedIndexSet.contains(indexPath.row) {
//      expandedIndexSet.remove(indexPath.row)
//      print(expandedIndexSet)
//    } else {
//      expandedIndexSet.insert(indexPath.row)
//    }
//    tableView.reloadRows(at: [indexPath], with: .automatic)
//  }
}
