//
//  EventListRepository.swift
//  NewArchitectureSample
//
//  Created by katayama_daiki on 2018/04/17.
//  Copyright © 2018年 katayama_daiki. All rights reserved.
//
import RxSwift

protocol EventListRepositoryProtocol {
    func fetch(seartchText: String) -> Single<[ConnpassEventEntity]>
}

class EventListRepository: EventListRepositoryProtocol {
    let connpassEventListDateStore: ConnpassEventListDateStoreProtocol

    init(connpassEventListDateStore: ConnpassEventListDateStoreProtocol) {
        self.connpassEventListDateStore = connpassEventListDateStore
    }

    func fetch(seartchText: String) -> Single<[ConnpassEventEntity]> {
        return connpassEventListDateStore.fetch(searchText: seartchText)
    }
}
