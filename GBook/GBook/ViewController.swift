//
//  ViewController.swift
//  GBook
//
//  Created by 马伟 on 2017/6/3.
//  Copyright © 2017年 马伟. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let label = UILabel(frame: CGRect.zero)
        label.text = "字体测试"
        label.sizeToFit()
        label.center = view.center
        
        // 添加自定义字体样式
        label.font = UIFont(name: "UniSun", size: 17)
        
        view.addSubview(label)
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

