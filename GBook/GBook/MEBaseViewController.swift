//
//  MEBaseViewController.swift
//  GBook
//
//  Created by 马伟 on 2017/6/6.
//  Copyright © 2017年 马伟. All rights reserved.
//

import UIKit

class MEBaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.white
        
    }

    
    
    @objc func leftButtonClick() {
        
        dismiss(animated: true, completion: nil)
    }
    
   

}
