//
//  EventListUseCase.swift
//  NewArchitectureSample
//
//  Created by katayama_daiki on 2018/04/16.
//  Copyright © 2018年 katayama_daiki. All rights reserved.
//
import RxSwift

protocol EventUseCasePresentationInput {
    func searchEvent(searchText: String) -> Single<[ConnpassEventModel]>
}

class EventListUseCase {
    var eventListRepository: EventListRepositoryProtocol!
    var translator: EventListTranslatorInput!
}

extension EventListUseCase: EventUseCasePresentationInput {
    func searchEvent(searchText: String) -> Single<[ConnpassEventModel]> {
        return eventListRepository.fetch(seartchText: searchText)
            .map { [unowned self] in self.translator.translate($0) }
    }
}
