//
//  ViewController.swift
//  BAEMIN
//
//  Created by 남경민 on 2022/12/05.
//

import UIKit

class ViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillDisappear(_ animated: Bool) {
        
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
    
    
}
/*
extension ViewController
{
    
    func addCustomNavigationBar()
    {
        // self.navigationController?.navigationBar.setValue(true, forKey: "hidesShadow")
        let navigationBar = navigationController?.navigationBar
        let navigationBarAppearance = UINavigationBarAppearance()
        let barBackgroundColor: UIColor = #colorLiteral(red: 0.1632660031, green: 0.7441982627, blue: 0.7212235332, alpha: 1)
        
        // bottom line 제거
        navigationBarAppearance.shadowColor = .clear
        navigationBar?.scrollEdgeAppearance = navigationBarAppearance
        // backgroundcolor 변경
        navigationBar?.scrollEdgeAppearance?.backgroundColor = barBackgroundColor
        
    }
    
    func addCustomSearchBar() {
        //서치바 만들기
        let searchBar = UISearchBar()
        searchBar.placeholder = "찾는 메뉴가 뭐에요?"
        
        if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
            //서치바 백그라운드 컬러
            textfield.backgroundColor = #colorLiteral(red: 0.1632660031, green: 0.7441982627, blue: 0.7212235332, alpha: 1)
            //플레이스홀더 글씨 색 정하기
            textfield.attributedPlaceholder = NSAttributedString(string: textfield.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        }
    }
     
}
*/
