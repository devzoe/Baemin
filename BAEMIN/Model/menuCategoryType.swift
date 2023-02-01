//
//  menuCategoryType.swift
//  BAEMIN
//
//  Created by 남경민 on 2022/12/09.
//

import Foundation

enum menuCategoryType: Int {
    case oneServing
    case koreanBoiledPork
    
    func get() -> Int {
        switch self {
        case .oneServing:
            return menuCategoryType.oneServing.rawValue
        case .koreanBoiledPork:
            return menuCategoryType.koreanBoiledPork.rawValue
        }
    }
}
