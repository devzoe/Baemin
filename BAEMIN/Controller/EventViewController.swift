//
//  MainViewController.swift
//  BAEMIN
//
//  Created by 남경민 on 2022/12/07.
//

import UIKit

class EventViewController: UIViewController {
    // 현재페이지 체크 변수 (자동 스크롤할 때 필요)
    var currentPage: Int = 0
    
    // 이벤트 객체 생성 - 데이터를 가져오기 위함
    private var eventService: EventCollectionViewModel = EventCollectionViewModel.shared
    // event cell type 지정
    let eventID = CollectionViewCellType.event.rawValue
    @IBOutlet weak var eventCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupEventCollectionView()
        startAutoScroll()
        // Do any additional setup after loading the view.
    }
    
    private func setupEventCollectionView() {
        // 1 셀 등록하기
        eventCollectionView.register(
            UINib(nibName: eventID, bundle: nil),
            forCellWithReuseIdentifier: eventID
        )
        
        // 2 Delegate
        eventCollectionView.delegate = self
        eventCollectionView.dataSource = self
    }
    
    func startAutoScroll() {
        //전체 cell 개수
        let totalCellCount = eventService.count
        
        DispatchQueue.global(qos: .default).async {
            
            while true
            {
                //2초에 한 번씩 paging
                sleep(2)
                
                DispatchQueue.main.async {
                    self.eventCollectionView.scrollToItem(at: IndexPath(item: self.currentPage, section: 0), at: .right, animated: true)
                    
                    //다시 처음으로
                    if self.currentPage == totalCellCount - 1 {
                        self.currentPage = 0
                    }
                    else {
                        self.currentPage += 1
                    }
                }
            }
            
        }
    }
}

// 3 프로토콜을 채택하여 구현
extension EventViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // 몇 개를 만들지
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // 데이터 전달 - count
        return eventService.count
    }
    // UI
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // 셀 구성
        let cell = eventCollectionView.dequeueReusableCell(
            withReuseIdentifier: eventID,
            for: indexPath) as! EventCollectionViewCell
        
        // 데이터 전달 - 읽기 Read
        let cellData = eventService.read(at: indexPath.row)
        cell.get(data: cellData)
        
        // UI + 데이터
        return cell
    }
    
    // UICollectionViewDelegateFlowLayout 상속
    //cell과 collectionview의 크기를 일치
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize.init(width: eventCollectionView.bounds.width, height: eventCollectionView.bounds.height)
    }
    
    //section 내부 cell간의 공간을 제거
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    //section 사이의 공간을 제거
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

extension EventViewController: UIScrollViewDelegate {
    
    //수동으로 넘을 때 page를 인식
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let x = scrollView.contentOffset.x
        let w = scrollView.bounds.size.width
        currentPage = Int(ceil(x/w))
        print(currentPage)
    }

}
