//
//  MERankViewController.swift
//  GBook
//
//  Created by 马伟 on 2017/6/6.
//  Copyright © 2017年 马伟. All rights reserved.
//

import UIKit

class MERankViewController: MEBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let label = UILabel(frame: CGRect.zero)
        label.text = "学无止境"
        label.sizeToFit()
        label.center = view.center
        
        label.font = UIFont(name: My_Font_Name, size: 17)
        
        view.addSubview(label)
        
    }


    
}
