//
//  ConnnpassEventEntity.swift
//  NewArchitectureSample
//
//  Created by katayama_daiki on 2018/04/17.
//  Copyright © 2018年 katayama_daiki. All rights reserved.
//

struct ConnpassEventEntity: Codable {
    var title: String
    var catchCopy: String
    var eventUrl: String
    var startedAt: String

    enum CodingKeys: String, CodingKey {
        case title
        case catchCopy = "catch"
        case eventUrl = "event_url"
        case startedAt = "started_at"
    }
}

struct ConpassEventListResponseEntity: Codable {
    var events: [ConnpassEventEntity]
}
