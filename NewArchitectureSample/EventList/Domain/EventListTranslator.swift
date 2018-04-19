//
//  EventListTranslator.swift
//  NewArchitectureSample
//
//  Created by katayama_daiki on 2018/04/17.
//  Copyright © 2018年 katayama_daiki. All rights reserved.
//

protocol EventListTranslatorInput {
    func translate(_ events: [ConnpassEventEntity]) -> [ConnpassEventModel]
}

struct EventListTranslator: EventListTranslatorInput {
    func translate(_ inputEvents: [ConnpassEventEntity]) -> [ConnpassEventModel] {
        var outputEvents = [ConnpassEventModel]()
        inputEvents.forEach { input in
            let eventModel = ConnpassEventModel(title: input.title, catchCopy: input.catchCopy, eventUrl: input.eventUrl, startedAt: input.startedAt)
            outputEvents.append(eventModel)
        }
        return outputEvents
    }
}
