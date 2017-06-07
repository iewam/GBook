//
//  MENewCommentSetTitleViewController.swift
//  GBook
//
//  Created by 马伟 on 2017/6/7.
//  Copyright © 2017年 马伟. All rights reserved.
//

import UIKit

typealias CommentTitleCallback = (_ commentTile : String)-> Void

class MENewCommentSetTitleViewController: MEBaseViewController {
    
    lazy var textField = UITextField(frame: CGRect.zero)
    var callback : CommentTitleCallback?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.textField.borderStyle = .roundedRect
        self.textField.placeholder = "书评标题"
        view.addSubview(textField)
        
        textField.snp.makeConstraints { (make) in
            make.top.equalTo(ME_FunctionalButton_Top_Margin + ME_FunctionalButton_Height + 30)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(40)
        }
    }

    
    
    @objc func leftButtonClick() {
    
        dismiss(animated: true, completion: nil)
    }
    
    @objc func rightButtonClick() {
    
        if (callback != nil) {
            
            callback!(self.textField.text!)
        }
        dismiss(animated: true, completion: nil)
    }
}
