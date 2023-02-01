//
//  ItemTableViewModel.swift
//  BAEMIN
//
//  Created by 남경민 on 2022/12/09.
//

import Foundation

/// 데이터를 추가 / 읽기 / 수정 / 삭제 (CRUD)
class ItemTableViewModel {
    // 싱글톤
    static let shared = ItemTableViewModel()
    private var itemList: [Item] = []
    // count
    var count: Int { self.itemList.count }
    
    private init() {
    }
    
    public func store(storeName : String) {
        if storeName == "효자동 설렁탕 신촌점" {
            [
                Item(imageName: "설렁탕", itemName: "효자동 설렁탕", price: 9900),
                Item(imageName: "얼큰설렁탕", itemName: "얼큰 효자동 설렁탕", price: 10900),
                Item(imageName: "돼지국밥", itemName: "돼지국밥", price: 9900),
                Item(imageName: "닭곰탕", itemName: "닭곰탕", price: 9900),
                Item(imageName: "닭개장", itemName: "닭개장", price: 9900),
                Item(imageName: "떡갈비", itemName: "떡갈비", price: 4500),
                
            ].forEach { store in
                self.itemList.append(store)
            }
        }
        if storeName == "엽전식당 연남점" {
            [
                Item(imageName: "제육볶음", itemName: "제육볶음", price: 9000),
                Item(imageName: "간장불백", itemName: "돼지 간장불백", price: 9000),
                Item(imageName: "삼겹구이", itemName: "직화 삼겹구이", price: 10000),
                Item(imageName: "오징어볶음", itemName: "오징어볶음", price: 10000),
                Item(imageName: "차돌비빔밥", itemName: "차돌비빔밥", price: 9900),
                Item(imageName: "김치찌개", itemName: "고기듬뿍 김치찌개", price: 7900),
                
            ].forEach { store in
                self.itemList.append(store)
            }
        }
        
        if storeName == "공차 홍대입구역점" {
            [
                Item(imageName: "그릭요거트밀크티", itemName: "그릭 요거트 밀크티", price: 5800),
                Item(imageName: "녹차밀크티", itemName: "녹차 버블티", price: 4900),
                Item(imageName: "딸기버블티", itemName: "딸기 버블티", price: 4500),
                Item(imageName: "딸기쥬얼리밀크티", itemName: "딸기 쥬얼리 밀크티", price: 6000),
                Item(imageName: "흑당밀크티", itemName: "흑당 밀크티", price: 4800),
                
                
            ].forEach { store in
                self.itemList.append(store)
            }
        }
    }
    

    
    public func remove() {
        itemList = []
    }

    
    // Create
    public func add() {
        self.itemList.append(Item(imageName: "추가된 데이터", itemName: "", price: 0))
    }
    
    // Read
    public func read(at: Int) -> Item {
        return itemList[at]
    }
    
    // Update
    public func update(at: Int, newValue: Item) {
        itemList[at] = newValue
    }
    
    // Delete
    public func delete(at: Int) {
        itemList.remove(at: at)
    }
}

struct Item {
    //var storeType : StoreType
    let imageName: String
    let itemName: String
    let price: Int
    
}
