//
//  StoreViewController.swift
//  BAEMIN
//
//  Created by 남경민 on 2022/12/09.
//

import UIKit

class StoreViewController: UIViewController {
    
    // 가게 객체 생성 - 데이터를 가져오기 위함
    private var storeService: StoreTableViewModel = StoreTableViewModel.shared
    var menuType : Menu = Menu(imageName: "", title: "")
    
    // store cell type 지정
    let storeID = TableViewCellType.store.rawValue
    
    let items = [0,1,2,3,4,5,6]

    @IBOutlet weak var storeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupStoreTableView()
        setUpMenuType()
        storeTableView.reloadData()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        storeService.remove()
    }
    
    private func setupStoreTableView() {
        // 1 셀 등록하기
        storeTableView.register(
            UINib(nibName: storeID, bundle: nil),
            forCellReuseIdentifier: storeID
        )
        
        // 2 Delegate
        storeTableView.delegate = self
        storeTableView.dataSource = self
        
        //storeTableView.rowHeight = UITableView.automaticDimension
        //storeTableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    // menuType에 따른 초기화가 다름
    private func setUpMenuType() {
        let menuTitle = menuType.title
        storeService.menu(menuType: menuTitle)
    }
    
    
    @IBAction func backButtonClicked(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cartButtonClicked(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let cartVC = storyboard.instantiateViewController(identifier: "CartViewController") as? CartViewController else {
            print("Controller not found")
            return
        }
        //let cellIndex = indexPath.row
        self.navigationController?.pushViewController(cartVC, animated: true)
    }
    
    @IBAction func mainButtonClicked(_ sender: UIBarButtonItem) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let VC = storyboard.instantiateViewController(identifier: "ViewController") as? ViewController else {
            print("Controller not found")
            return
        }
        //let cellIndex = indexPath.row
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
}



extension StoreViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storeService.count
    }
    
    // UI
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 셀 구성
        let cell = storeTableView.dequeueReusableCell(
            withIdentifier: storeID,
            for: indexPath) as! StoreTableViewCell
        
        // 데이터 전달 - 읽기 Read
        let cellData = storeService.read(at: indexPath.row)
        cell.get(data: cellData)
        
        // UI + 데이터
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  (storeTableView.bounds.height) * 0.18
    }
    
    // cell이 선택됨
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let itemVC = storyboard.instantiateViewController(identifier: "ItemViewController") as? ItemViewController else {
            print("Controller not found")
            return
        }
        let cellIndex = indexPath.row
        itemVC.store = storeService.read(at: cellIndex)
       
        self.navigationController?.pushViewController(itemVC, animated: true)
        
    }
    
}
