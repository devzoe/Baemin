//
//  RecommendationCollectionViewModel.swift
//  BAEMIN
//
//  Created by 남경민 on 2022/12/07.
//

import Foundation

/// 데이터를 추가 / 읽기 / 수정 / 삭제 (CRUD)
class RecommendationCollectionViewModel {
    // 싱글톤
    static let shared = RecommendationCollectionViewModel()
    private var recommendationList: [Recommendation] = []
    // count
    var count: Int { self.recommendationList.count }
    
    private init() {
        [
            Recommendation(imageName: "추천1", title: "집밥이 그리워"),
            Recommendation(imageName: "추천2", title: "뜨끈한 국물"),
            Recommendation(imageName: "추천3", title: "혼밥도 맛있게"),
            Recommendation(imageName: "추천4", title: "응원엔 피자"),
            Recommendation(imageName: "추천5", title: "재주문율 높아요"),
            Recommendation(imageName: "추천6", title: "찜 많은 가게"),
            Recommendation(imageName: "추천7", title: "마라탕 테라피"),
            Recommendation(imageName: "추천8", title: "푸짐한 샐러드"),
            Recommendation(imageName: "추천9", title: "할인 중인 브랜드"),
            Recommendation(imageName: "추천10", title: "추천 메뉴 더보기"),
        ].forEach { recommendation in
            self.recommendationList.append(recommendation)
        }
    }
    
    // Create
    public func add() {
        self.recommendationList.append(Recommendation(imageName: "추가된 데이터", title: ""))
    }
    
    // Read
    public func read(at: Int) -> Recommendation {
        return recommendationList[at]
    }
    
    // Update
    public func update(at: Int, newValue: Recommendation) {
        recommendationList[at] = newValue
    }
    
    // Delete
    public func delete(at: Int) {
        recommendationList.remove(at: at)
    }
}

struct Recommendation {
    let imageName: String
    let title: String
}
