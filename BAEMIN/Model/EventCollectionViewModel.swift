//
//  EventCollectionViewModel.swift
//  BAEMIN
//
//  Created by 남경민 on 2022/12/07.
//

import Foundation

/// 데이터를 추가 / 읽기 / 수정 / 삭제 (CRUD)
class EventCollectionViewModel {
    // 싱글톤
    static let shared = EventCollectionViewModel()
    private var eventList: [Event] = []
    // count
    var count: Int { self.eventList.count }
    
    private init() {
        [
            Event(name: "이벤트1"),
            Event(name: "이벤트2"),
            Event(name: "이벤트3"),
            Event(name: "이벤트4"),
            Event(name: "이벤트5"),
        ].forEach { event in
            self.eventList.append(event)
        }
    }
    
    // Create
    public func add() {
        self.eventList.append(Event(name: "추가된 데이터"))
    }
    
    // Read
    public func read(at: Int) -> Event {
        return eventList[at]
    }
    
    // Update
    public func update(at: Int, newValue: Event) {
        eventList[at] = newValue
    }
    
    // Delete
    public func delete(at: Int) {
        eventList.remove(at: at)
    }
}

struct Event {
    let name: String
}
