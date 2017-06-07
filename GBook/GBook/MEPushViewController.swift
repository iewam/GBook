//
//  MEPushViewController.swift
//  GBook
//
//  Created by 马伟 on 2017/6/6.
//  Copyright © 2017年 马伟. All rights reserved.
//

import UIKit

class MEPushViewController: MEBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupNavNewCommentBtn()
        
    }

   

}


//MARK:------ 设置UI ------
extension MEPushViewController {

    //MARK: 设置新建书评按钮
    fileprivate func setupNavNewCommentBtn() {
    
        let newCommentBtn = UIButton(frame: CGRect(x: 10, y: 0, width: SCREEN_WIDTH * 0.5, height: 44))
        newCommentBtn.setTitle("  新建书评", for: .normal)
        newCommentBtn.setTitleColor(Main_Color, for: .normal)
        newCommentBtn.setImage(UIImage(named: "plus circle"), for: .normal)
        newCommentBtn.titleLabel?.font = UIFont(name: My_Font_Name, size: 17)
        newCommentBtn.contentHorizontalAlignment = .left
        newCommentBtn.addTarget(self, action: #selector(newCommentBtnClick), for: .touchUpInside)
        navigationController?.navigationBar.addSubview(newCommentBtn)
    }
    
    
    @objc private func newCommentBtnClick() {
    
        let newCommentVC = MENewCommentViewController()
        
        MEGeneralFactory.setupNormalFunctionalButton(newCommentVC, leftTitle: "关闭", rightTitle: "发布")
        
        present(newCommentVC, animated: true, completion: nil)
    }
    
}
