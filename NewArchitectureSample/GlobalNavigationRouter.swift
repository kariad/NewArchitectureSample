//
//  GlobalNavigationRouter.swift
//  NewArchitectureSample
//
//  Created by katayama_daiki on 2018/04/16.
//  Copyright © 2018年 katayama_daiki. All rights reserved.
//

import UIKit

protocol GlobalRouter {
    var window: UIWindow { set get }

    func showEventListView()
}

class GlobalNavigationRouter: GlobalRouter {
    var window: UIWindow
    var mainNavigationController: UINavigationController?

    init(window: UIWindow) {
        self.window = window
    }

    func showEventListView() {
        let eventListViewController = EventListViewController()
        let eventListPresenter = EventListPresenter()
        let eventListInteractor = EventListInteractor(
            searchText: eventListViewController.searchBar.rx.text.asDriver(),
            searchButtonTapped: eventListViewController.searchBar.rx.searchButtonClicked.asDriver()
        )
        let eventListUseCase = EventListUseCase()
        eventListViewController.interactor = eventListInteractor
        eventListInteractor.presenter = eventListPresenter
        eventListPresenter.viewController = eventListViewController
        eventListInteractor.useCase = eventListUseCase

        mainNavigationController = UINavigationController(rootViewController: eventListViewController)
        window.rootViewController = mainNavigationController
    }
}
