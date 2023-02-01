//
//  ItemDetailViewController.swift
//  BAEMIN
//
//  Created by 남경민 on 2022/12/10.
//

import UIKit

class ItemDetailViewController: UIViewController {
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var itemCount: UILabel!
    @IBOutlet weak var itemStepper: UIStepper!
    @IBOutlet weak var orderPrice: UILabel!
    
    private var cartService: CartTableViewModel = CartTableViewModel.shared

    var item: Item = Item(imageName: "", itemName: "", price: 0)
    var count = 1
    var totalPrice = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        // Do any additional setup after loading the view.
    }
    
    func setUpUI() {
        itemImage.image = UIImage(named: item.imageName)
        itemName.text = item.itemName
        price.text = String(item.price)
        
        totalPrice = item.price
        
        itemCount.text = String(count)
        orderPrice.text = String(totalPrice)
        
    }
    @IBAction func stepperClicked(_ sender: UIStepper) {
        //수량 변경
        count = Int(sender.value)
        itemCount.text = String(count)
        
        // 총 주문가격 변경
        totalPrice = count * item.price
        orderPrice.text = String(totalPrice)
        
    }
    
    @IBAction func cartButtonClicked(_ sender: UIButton) {
        cartService.add(data: Cart(itemName: item.itemName, imageName: item.imageName, price: item.price, totalPrice: totalPrice, orderCount: count)) // Create
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let cartVC = storyboard.instantiateViewController(identifier: "CartViewController") as? CartViewController else {
            print("Controller not found")
            return
        }
        //let cellIndex = indexPath.row
        self.navigationController?.pushViewController(cartVC, animated: true)

    
    }
    
    @IBAction func backButtonClicked(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cartButtonClicked3(_ sender: UIBarButtonItem) {
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
