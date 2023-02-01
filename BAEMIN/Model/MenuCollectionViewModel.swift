//
//  MenuCollectionViewModel.swift
//  BAEMIN
//
//  Created by 남경민 on 2022/12/07.
//

import Foundation

/// 데이터를 추가 / 읽기 / 수정 / 삭제 (CRUD)
class MenuCollectionViewModel {
    // 싱글톤
    static let shared = MenuCollectionViewModel()
    private var menuList: [Menu] = []
    // count
    var count: Int { self.menuList.count }
    
    private init() {
        [
            Menu(imageName: "1인분", title: "1인분"),
            Menu(imageName: "보쌈", title: "보쌈"),
            Menu(imageName: "찌개", title: "찌개"),
            Menu(imageName: "일식", title: "일식"),
            Menu(imageName: "피자", title: "피자"),
            Menu(imageName: "고기", title: "고기"),
            Menu(imageName: "야식", title: "야식"),
            Menu(imageName: "양식", title: "양식"),
            Menu(imageName: "치킨", title: "치킨"),
            Menu(imageName: "짜장면", title: "중식"),
            Menu(imageName: "아시안", title: "아시안"),
            Menu(imageName: "백반", title: "백반"),
            Menu(imageName: "도시락", title: "도시락"),
            Menu(imageName: "분식", title: "분식"),
            Menu(imageName: "디저트", title: "디저트"),
            Menu(imageName: "햄버거", title: "햄버거"),
            Menu(imageName: "채식", title: "채식"),
            Menu(imageName: "브랜드관", title: "브랜드관"),
            Menu(imageName: "맛집랭킹", title: "맛집랭킹"),
            Menu(imageName: "러쉬", title: "러쉬"),
            
        ].forEach { menu in
            self.menuList.append(menu)
        }
    }
    
    // Create
    public func add() {
        self.menuList.append(Menu(imageName: "추가된 데이터", title: ""))
    }
    
    // Read
    public func read(at: Int) -> Menu {
        return menuList[at]
    }
    
    // Update
    public func update(at: Int, newValue: Menu) {
        menuList[at] = newValue
    }
    
    // Delete
    public func delete(at: Int) {
        menuList.remove(at: at)
    }
}

struct Menu {
    let imageName: String
    let title: String
}
