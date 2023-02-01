//
//  CartTableViewModel.swift
//  BAEMIN
//
//  Created by 남경민 on 2022/12/10.
//

import Foundation

/// 데이터를 추가 / 읽기 / 수정 / 삭제 (CRUD)
class CartTableViewModel {
    // 싱글톤
    static let shared = CartTableViewModel()
    private var cartList: [Cart] = []
    // count
    var count: Int { self.cartList.count }
    var totalOrderPrice = 0
    
    private init() {
    }
    
    public func remove() {
        cartList = []
    }
    
    // Create
    public func add(data: Cart) {
        self.cartList.append(data)
    }
    
    // Read
    public func read(at: Int) -> Cart {
        return cartList[at]
    }
    
    // Update
    public func update(at: Int, newValue: Cart) {
        cartList[at] = newValue
    }
    
    // orderCount Update
    public func orderCountupdate(at: Int, newCount: Int) {
        cartList[at].orderCount = newCount
        cartList[at].totalPrice = newCount * cartList[at].price
        
    }
    // Delete
    public func delete(at: Int) {
        cartList.remove(at: at)
    }
    
    public func calcTotalOrderPrice() {
        totalOrderPrice = 0
        for cart in cartList {
            totalOrderPrice += cart.totalPrice
        }
    }
}




struct Cart {
    let itemName: String
    let imageName: String
    let price: Int
    var totalPrice: Int
    var orderCount: Int
}
