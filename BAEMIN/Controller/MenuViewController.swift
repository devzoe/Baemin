//
//  MenuViewController.swift
//  BAEMIN
//
//  Created by 남경민 on 2022/12/07.
//

import UIKit

class MenuViewController: UIViewController {

    // 메뉴 객체 생성 - 데이터를 가져오기 위함
    private var menuService: MenuCollectionViewModel = MenuCollectionViewModel.shared
    // menu cell type 지정
    let menuID = CollectionViewCellType.menu.rawValue
    let items = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
    
    @IBOutlet weak var menuCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setupMenuCollectionView()
        //startAutoScroll()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupMenuCollectionView()
        
    }
    
    private func setupMenuCollectionView() {
        // 1 셀 등록하기
        menuCollectionView.register(
            UINib(nibName: menuID, bundle: nil),
            forCellWithReuseIdentifier: menuID
        )
        
        // 2 Delegate
        menuCollectionView.delegate = self
        menuCollectionView.dataSource = self
    }
    
    
}

// 3 프로토콜을 채택하여 구현
extension MenuViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // 몇 개를 만들지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 데이터 전달 - count
        return menuService.count
    }
    // UI
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 셀 구성
        let cell = menuCollectionView.dequeueReusableCell(
            withReuseIdentifier: menuID,
            for: indexPath) as! MenuCollectionViewCell
        
        // 데이터 전달 - 읽기 Read
        let cellData = menuService.read(at: indexPath.row)
        cell.get(data: cellData)
        
        // UI + 데이터
        return cell
    }
    
    // UICollectionViewDelegateFlowLayout 상속
    //cell 크기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize.init(width: (menuCollectionView.bounds.width) * 0.15, height: (menuCollectionView.bounds.height) * 0.25)
    }
    
    //section 내부 cell간의 공간을 제거
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    //section 사이의 공간을 제거
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // cell이 선택됨
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let storeVC = storyboard.instantiateViewController(identifier: "StoreViewController") as? StoreViewController else {
            print("Controller not found")
            return
        }
        let cellIndex = indexPath.row
        storeVC.menuType = menuService.read(at: cellIndex)
        self.navigationController?.pushViewController(storeVC, animated: true)
    }
    
}
