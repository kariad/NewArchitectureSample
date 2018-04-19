//
//  EventListInteractor.swift
//  NewArchitectureSample
//
//  Created by katayama_daiki on 2018/04/16.
//  Copyright © 2018年 katayama_daiki. All rights reserved.
//
import RxSwift
import RxCocoa

protocol EventListInteractorOutput {
    var eventModels: BehaviorRelay<[ConnpassEventModel]> { get }
}

class EventListInteractor: EventListInteractorOutput {
    var presenter: EventListPresenter?
    var useCase: EventUseCasePresentationInput?

    var searchText = BehaviorRelay<String>(value: "")
    var searchButtonTapped: Driver<Void>

    var eventModels = BehaviorRelay<[ConnpassEventModel]>(value: [])

    var viewState: EventListViewState = .normal

    fileprivate var disposeBag = DisposeBag()

    init(searchText: Driver<String?>, searchButtonTapped: Driver<Void>) {
        self.searchButtonTapped = searchButtonTapped

        searchText.drive(onNext: { [unowned self] text in
            self.searchText.accept(text!)
        }).disposed(by: disposeBag)

        searchButtonTapped.drive(onNext: { [unowned self] _ in
            guard self.viewState != .normal else { return }
            self.viewState = .loading
            self.useCase?.searchEvent(searchText: self.searchText.value)
                .subscribe(
                    onSuccess: { events in
                        self.eventModels.accept(events)
                    },
                    onError: { error in
                        
                    }
                ).disposed(by: self.disposeBag)
        }).disposed(by: disposeBag)
    }
}
