//
//  CartViewController.swift
//  BAEMIN
//
//  Created by 남경민 on 2022/12/10.
//

import UIKit

class CartViewController: UIViewController {
    // 카트 아이템 객체 생성 - 데이터를 가져오기 위함
    private var cartService: CartTableViewModel = CartTableViewModel.shared
    // cart item cell type 지정
    let cartID = TableViewCellType.cartItem.rawValue
    @IBOutlet weak var totalOrderCount: UILabel!
    @IBOutlet weak var totalOrderPrice: UILabel!
    
    @IBOutlet weak var cartTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupItemTableView()
        setUI()
        
    }
    
    private func setUI() {
        totalOrderCount.text = String(cartService.count)
        cartService.calcTotalOrderPrice()
        totalOrderPrice.text = String(cartService.totalOrderPrice)
    }
    
    private func setupItemTableView() {
        // 1 셀 등록하기
        cartTableView.register(
            UINib(nibName: cartID, bundle: nil),
            forCellReuseIdentifier: cartID
        )
        
        // 2 Delegate
        cartTableView.delegate = self
        cartTableView.dataSource = self
    }
    
    @objc func deleteButtonAction(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: cartTableView)
        guard let indexPath = cartTableView.indexPathForRow(at: point) else { return }
        cartService.delete(at: indexPath.row)
        cartTableView.deleteRows(at: [indexPath], with: .automatic)
        setUI()
    }
    
    @objc func orderStepperAction(_ sender: UIStepper) {
        let point = sender.convert(CGPoint.zero, to: cartTableView)
        guard let indexPath = cartTableView.indexPathForRow(at: point) else { return }
        // update
        
        let newCount = Int(sender.value)
        cartService.orderCountupdate(at: indexPath.row, newCount: newCount)
        cartTableView.reloadData()
        setUI()
    }
    
    @IBAction func orderButtonClicked(_ sender: UIButton) {
        let alert = UIAlertController(title: "주문하시겠습니까?", message: "", preferredStyle: .alert)
        let confirm = UIAlertAction(title: "네", style: .default) { action in
            self.cartService.remove()
            
            let alert2 = UIAlertController(title: "주문 완료", message: "주문에 성공하였습니다!", preferredStyle: .alert)
            alert2.addAction(UIAlertAction(title: "확인", style: .default) { action in
            })
            self.present(alert2, animated: true, completion: nil)
            self.cartTableView.reloadData()
            self.setUI()
        }
        let cancel = UIAlertAction(title: "아니요", style: .cancel, handler: nil)
        alert.addAction(confirm)
        alert.addAction(cancel)
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func backButtonClicked(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
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

extension CartViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cartService.count
    }
    
    // UI
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 셀 구성
        let cell = cartTableView.dequeueReusableCell(
            withIdentifier: cartID,
            for: indexPath) as! CartTableViewCell
        
        // Delete
        cell.deleteButton.addTarget(self, action: #selector(deleteButtonAction(_:)), for: .touchUpInside)
        // Update
        cell.orderStepper.addTarget(self, action: #selector(orderStepperAction(_:)), for: .touchUpInside)
        
        // 데이터 전달 - 읽기 Read
        let cellData = cartService.read(at: indexPath.row)
        cell.get(data: cellData)

        return cell
    }
    
}
