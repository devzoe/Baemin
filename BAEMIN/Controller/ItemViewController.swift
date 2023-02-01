//
//  ItemViewController.swift
//  BAEMIN
//
//  Created by 남경민 on 2022/12/09.
//

import UIKit

class ItemViewController: UIViewController {
    var storeType = 0
    // 아이템 객체 생성 - 데이터를 가져오기 위함
    private var itemService: ItemTableViewModel = ItemTableViewModel.shared
    var store: Store = Store(imageName: "", storeName: "", rating: "", minOrder: 0, tip: 0)
    // item cell type 지정
    let itemID = TableViewCellType.item.rawValue

    @IBOutlet weak var itemTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad")
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear")
        setupItemTableView()
        setUpItemType()
        itemTableView.reloadData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear")
        

    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDisappear")
        itemService.remove()
    }
     
    
    
    private func setupItemTableView() {
        // 1 셀 등록하기
        itemTableView.register(
            UINib(nibName: itemID, bundle: nil),
            forCellReuseIdentifier: itemID
        )
        
        // 2 Delegate
        itemTableView.delegate = self
        itemTableView.dataSource = self
    }
    
    // itemType에 따른 초기화가 다름
    private func setUpItemType() {
        let store = store.storeName
        itemService.store(storeName: store)
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
    
    @IBAction func mainButtonClicked(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let VC = storyboard.instantiateViewController(identifier: "ViewController") as? ViewController else {
            print("Controller not found")
            return
        }
        //let cellIndex = indexPath.row
        self.navigationController?.pushViewController(VC, animated: true)
    }
    
    
}

extension ItemViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemService.count
    }
    
    // UI
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 셀 구성
        let cell = itemTableView.dequeueReusableCell(
            withIdentifier: itemID,
            for: indexPath) as! ItemTableViewCell
        
        // 데이터 전달 - 읽기 Read
        let cellData = itemService.read(at: indexPath.row)
        cell.get(data: cellData)
        
        // UI + 데이터
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return  (itemTableView.bounds.height) * 0.18
    }

    
    
    // cell이 선택됨
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let itemDetailVC = storyboard.instantiateViewController(identifier: "ItemDetailViewController") as? ItemDetailViewController else {
            print("Controller not found")
            return
        }
        let cellIndex = indexPath.row
        itemDetailVC.item = itemService.read(at: cellIndex) // 데이터 넘겨주기.
        self.navigationController?.pushViewController(itemDetailVC, animated: true)
        
    }
    

    
}
