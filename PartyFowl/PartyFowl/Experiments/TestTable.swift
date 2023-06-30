//
//  TestTable.swift
//  PartyFowl
//
//  Created by Logan Melton on 6/29/23.
//

import UIKit

class TestTable: UIView {
  var table: UITableView!

  override init(frame: CGRect) {
    super.init(frame: frame)
    styleView()
    layoutView()
    table.register(TestCell.self, forCellReuseIdentifier: TestCell.reuseID)
    table.dataSource = self
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension TestTable {
  private func styleView() {
    table = UITableView()
    table.translatesAutoresizingMaskIntoConstraints = false
  }

  private func layoutView() {
    addSubview(table)
    NSLayoutConstraint.activate([
      table.topAnchor.constraint(equalTo: topAnchor),
      table.leadingAnchor.constraint(equalTo: leadingAnchor),
      table.trailingAnchor.constraint(equalTo: trailingAnchor),
      table.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }
}

extension TestTable: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: TestCell.reuseID,
                                                   for: indexPath) as? TestCell else {
      return UITableViewCell()
    }
    cell.optionLabel.text = "fuck"
    cell.setControl(to: .toggle)
    return cell
  }
}
