//
//  EventListViewController.swift
//  NewArchitectureSample
//
//  Created by katayama_daiki on 2018/04/16.
//  Copyright © 2018年 katayama_daiki. All rights reserved.
//

import UIKit
import PureLayout
import RxSwift
import RxCocoa

class EventListViewController: UIViewController {
    var interactor: EventListInteractor?

    let searchBar = UISearchBar(frame: .zero)
    let tableview = UITableView(frame: .zero, style: .grouped)
    let activityIndicatorView = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    var events = [ConnpassEventModel]()
    let eventCellIdentifier = "eventCell"

    var disposeBag = DisposeBag()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addSubviews()
        configureSubviews()
        addConstraints()
    }

    func addSubviews() {
        view.addSubview(self.tableview)
        view.addSubview(self.activityIndicatorView)
    }

    func configureSubviews() {
        view.backgroundColor = .white
        navigationItem.titleView = self.searchBar
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(EventCell.self, forCellReuseIdentifier: self.eventCellIdentifier)
    }

    func addConstraints() {
        tableview.autoPinEdgesToSuperviewEdges()

        activityIndicatorView.autoAlignAxis(toSuperviewAxis: .vertical)
        activityIndicatorView.autoAlignAxis(toSuperviewAxis: .horizontal)
    }
}

extension EventListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.events.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: self.eventCellIdentifier) as! EventCell
        cell.configureCell(self.events[indexPath.row])
        return cell
    }
}

extension EventListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableview.deselectRow(at: indexPath, animated: true)
//        self.router.displayEventDetailView(url: self.events[indexPath.row].eventUrl)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}

extension EventListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
}
