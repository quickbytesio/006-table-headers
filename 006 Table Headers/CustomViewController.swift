//
//  CustomViewController.swift
//  Quickbytes Example - 001 Table View 
//
//  Created by Aaron Brethorst on 1/29/18.
//  Copyright © 2018 Quickbytes. All rights reserved.
//

import UIKit

class CustomHeader: UITableViewHeaderFooterView {
    static let reuseIdentifer = "CustomHeaderReuseIdentifier"
    let customLabel = UILabel.init()

    override public init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        customLabel.font = UIFont.preferredFont(forTextStyle: .largeTitle)

        customLabel.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(customLabel)

        let margins = contentView.layoutMarginsGuide
        customLabel.leadingAnchor.constraint(equalTo: margins.leadingAnchor).isActive = true
        customLabel.trailingAnchor.constraint(equalTo: margins.trailingAnchor).isActive = true
        customLabel.topAnchor.constraint(equalTo: margins.topAnchor).isActive = true
        customLabel.bottomAnchor.constraint(equalTo: margins.bottomAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CustomViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let tableView = UITableView.init()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.title = "Custom Section Headers"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white

        self.tableView.frame = self.view.bounds
        self.tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.tableView.dataSource = self
        self.tableView.delegate = self

        self.tableView.register(CustomHeader.self, forHeaderFooterViewReuseIdentifier: CustomHeader.reuseIdentifer)

        self.view.addSubview(self.tableView)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: CustomHeader.reuseIdentifer) as? CustomHeader else {
            return nil
        }

        header.customLabel.text = "Section \(section + 1)"

        return header
    }

    static let cellReuseIdentifier = "identifier"
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: CustomViewController.cellReuseIdentifier)

        if cell == nil {
            cell = UITableViewCell.init(style: .default, reuseIdentifier: CustomViewController.cellReuseIdentifier)
        }

        cell?.textLabel?.text = "Row \(indexPath.row + 1)"

        return cell!
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "You Clicked on a Row!", message: indexPath.description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

        self.present(alert, animated: true, completion: nil)

        tableView.deselectRow(at: indexPath, animated: true)
    }

}
