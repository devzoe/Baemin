//
//  RecommendationViewController.swift
//  BAEMIN
//
//  Created by 남경민 on 2022/12/07.
//

import UIKit

class RecommendationViewController: UIViewController {

    // 추천 객체 생성 - 데이터를 가져오기 위함
    private var recommendationService: RecommendationCollectionViewModel = RecommendationCollectionViewModel.shared
    // recommendation cell type 지정
    let recommendationID = CollectionViewCellType.recommendation.rawValue

    @IBOutlet weak var recommendationCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRecommendationCollectionView()
        //startAutoScroll()
        // Do any additional setup after loading the view.
    }
    
    private func setupRecommendationCollectionView() {
        // 1 셀 등록하기
        recommendationCollectionView.register(
            UINib(nibName: recommendationID, bundle: nil),
            forCellWithReuseIdentifier: recommendationID
        )
        
        // 2 Delegate
        recommendationCollectionView.delegate = self
        recommendationCollectionView.dataSource = self
    }
    
}

// 3 프로토콜을 채택하여 구현
extension RecommendationViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // 몇 개를 만들지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 데이터 전달 - count
        return recommendationService.count
    }
    // UI
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 셀 구성
        let cell = recommendationCollectionView.dequeueReusableCell(
            withReuseIdentifier: recommendationID,
            for: indexPath) as! RecommendationCollectionViewCell
        
        // 데이터 전달 - 읽기 Read
        let cellData = recommendationService.read(at: indexPath.row)
        cell.get(data: cellData)
        
        // UI + 데이터
        return cell
    }
    
    // UICollectionViewDelegateFlowLayout 상속
    //cell 크기
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize.init(width: (recommendationCollectionView.bounds.width) * 0.3, height: (recommendationCollectionView.bounds.height) * 0.9)
    }
    
    //section 내부 cell간의 공간을 제거
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    //section 사이의 공간을 제거
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
}
