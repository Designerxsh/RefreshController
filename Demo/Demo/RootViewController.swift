//
//  RootViewController.swift
//  Demo
//
//  Created by Edmond on 05/11/2017.
//  Copyright © 2017 Edmond. All rights reserved.
//

import Foundation
import UIKit


class RootViewController : UITableViewController {

    override func viewDidLoad() {
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        cell?.textLabel?.text = "pull and refresh Demo"
        return cell!
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

