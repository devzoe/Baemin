//
//  StoreTableViewModel.swift
//  BAEMIN
//
//  Created by 남경민 on 2022/12/09.
//

import Foundation

/// 데이터를 추가 / 읽기 / 수정 / 삭제 (CRUD)
class StoreTableViewModel {
    // 싱글톤
    static let shared = StoreTableViewModel()
    private var storeList: [Store] = []
    // count
    var count: Int { self.storeList.count }
    
    private init() {
        
    }
    
    public func menu(menuType: String) {
        if menuType == "1인분" {
            [
                Store(imageName: "효자동설렁탕", storeName: "효자동 설렁탕 신촌점", rating: "🌟 5.0", minOrder: 5000, tip: 3900),
                Store(imageName: "엽전식당", storeName: "엽전식당 연남점", rating: "🌟 4.9", minOrder: 9000, tip: 2500),
                Store(imageName: "한식밥상", storeName: "한식밥상 홍대점", rating: "🌟 4.9", minOrder: 3000, tip: 2500),
                Store(imageName: "직화한상", storeName: "직화한상 홍대점", rating: "🌟 4.8", minOrder: 13000, tip: 2000),
                Store(imageName: "파스타어때", storeName: "파스타어때 마포신촌본점", rating: "🌟 4.7", minOrder: 5000, tip: 3500),
                Store(imageName: "싸다김밥", storeName: "싸다김밥 홍대역점", rating: "🌟 4.6", minOrder: 5000, tip: 3900),
                
            ].forEach { store in
                self.storeList.append(store)
            }
        }
        if menuType == "보쌈" {
            [
                Store(imageName: "원할머니", storeName: "원할머니보쌈족발 홍대역점", rating: "🌟 4.8", minOrder: 18000, tip: 4000),
                Store(imageName: "마왕족발", storeName: "마왕족발 홍대점", rating: "🌟 4.9", minOrder: 20000, tip: 3000),
                Store(imageName: "화정족발", storeName: "화정족발이야기 국내산족발 본점", rating: "🌟 4.9", minOrder: 25000, tip: 3000),
                Store(imageName: "미스터보쌈", storeName: "미스터보쌈 망원점", rating: "🌟 5.0", minOrder: 22000, tip: 2800),
                Store(imageName: "미쓰족발", storeName: "미쓰족발", rating: "🌟 4.9", minOrder: 20000, tip: 2000),
                Store(imageName: "잭아저씨", storeName: "잭아저씨 족발보쌈", rating: "🌟 4.9", minOrder: 29000, tip: 2000),
                
            ].forEach { store in
                self.storeList.append(store)
            }
        }
        
        if menuType == "디저트" {
            [
                Store(imageName: "공차", storeName: "공차 홍대입구역점", rating: "🌟 4.8", minOrder: 12000, tip: 2200),
                Store(imageName: "엔젤리너스", storeName: "엔젤리너스 L7홍대점", rating: "🌟 4.7", minOrder: 12000, tip: 3000),
                Store(imageName: "쥬씨", storeName: "쥬씨 신촌점", rating: "🌟 5.0", minOrder: 6000, tip: 4500),
                Store(imageName: "투썸", storeName: "투썸플레이스 홍대입구역점", rating: "🌟 4.9", minOrder: 12000, tip: 2000),
                Store(imageName: "던킨", storeName: "던킨 홍대역점", rating: "🌟 4.5", minOrder: 13000, tip: 3000),
                Store(imageName: "홍콩다방", storeName: "홍콩다방 홍대입구역점", rating: "🌟 4.8", minOrder: 99000, tip: 1500),
                
            ].forEach { store in
                self.storeList.append(store)
            }
            
        }
        
    }
    public func remove() {
        storeList = []
    }

    
    // Create
    public func add() {
        self.storeList.append(Store(imageName: "추가된 데이터", storeName: "", rating: "", minOrder: 0, tip: 0))
    }
    
    // Read
    public func read(at: Int) -> Store {
        return storeList[at]
    }
    
    // Update
    public func update(at: Int, newValue: Store) {
        storeList[at] = newValue
    }
    
    // Delete
    public func delete(at: Int) {
        storeList.remove(at: at)
    }
}

struct Store {
    let imageName: String
    let storeName: String
    let rating: String
    let minOrder: Int
    let tip: Int
}
