//
//  ViewController.swift
//  PullToRefreshController
//
//  Created by Edmond on 5/6/2559 BE.
//  Copyright © 2559 BE Edmond. All rights reserved.
//

import UIKit
import RefreshController


class ViewController: UIViewController {
    var tableView: UITableView!
    var dataSource = [Date]()
    var refreshController: PullToRefreshController!
    var loadMoreController: PullToRefreshController!

    override func viewDidLoad() {
        super.viewDidLoad()

        let refreshItem = UIBarButtonItem(title: "Refresh", style: .plain, target: self, action: #selector(startToRefresh))
        let loadMoreItem = UIBarButtonItem(title: "LoadMore", style: .plain, target: self, action: #selector(startToLoadMore))
        navigationItem.rightBarButtonItems = [refreshItem, loadMoreItem]
        edgesForExtendedLayout = .bottom

        configureDataSource()

        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        tableView.delegate = self
        tableView.contentInset = .zero
        tableView.dataSource = self
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "cell")
        view.addSubview(tableView)
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        }

        refreshController = PullToRefreshController(scrollView: tableView, direction: .top)
        refreshController.triggerHandler = { [weak self] in
            self?.insertRow(isTop: true)
        }

        loadMoreController = PullToRefreshController(scrollView: tableView, direction: .bottom)
        loadMoreController.triggerHandler = { [weak self] in
            self?.insertRow(isTop: false)
        }
        tableView.reloadData()
    }

    private func configureDataSource() {
        for i in 0...12 {
            dataSource.append(Date(timeIntervalSinceNow: TimeInterval(-i * 90)))
        }
    }

    @objc private func startToRefresh() {
        refreshController.triggerRefresh(true)
    }

    @objc private func startToLoadMore() {
        loadMoreController.triggerRefresh(true)
    }

    private func insertRow(isTop: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] () -> Void in
            if isTop {
                self?.dataSource.insert(Date(), at: 0)
            } else {
                self?.dataSource.append(Date())
            }
            self?.tableView.reloadData()
            if isTop {
                self?.refreshController.stopToRefresh(true)
            } else {
                self?.loadMoreController.stopToRefresh(true)
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        let date = dataSource[indexPath.row]
        cell?.textLabel?.text = DateFormatter.localizedString(from: date, dateStyle: .none, timeStyle: .medium)
        return cell!
    }
}
