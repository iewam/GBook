//
//  MENewCommentTopView.swift
//  GBook
//
//  Created by 马伟 on 2017/6/6.
//  Copyright © 2017年 马伟. All rights reserved.
//

import UIKit
import SnapKit
import JVFloatLabeledTextField

@objc protocol MENewCommentTopViewDelegate {
    
    @objc optional func bookCoverBtnDidClick()
}

class MENewCommentTopView: UIView {

    // 懒加载子控件
    lazy var bookCoverBtn = UIButton(frame: CGRect.zero)
    lazy var bookNameTF = JVFloatLabeledTextField(frame: CGRect.zero)
    lazy var authorNameTF = JVFloatLabeledTextField(frame: CGRect.zero)
    
    weak var  delegate : MENewCommentTopViewDelegate?

    
    override init(frame: CGRect) {
        super.init(frame: frame)
    
        backgroundColor = UIColor.white
        setupSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 布局子控件
        self.bookCoverBtn.snp.makeConstraints { (make) in
            make.width.equalTo(110)
            make.height.equalTo(141)
            make.left.equalTo(10)
            make.top.equalTo(20)
        }
        
        
        self.bookNameTF.snp.makeConstraints { (make) in
            make.top.equalTo(self.bookCoverBtn.snp.top)
            make.left.equalTo(self.bookCoverBtn.snp.right).offset(10)
            make.right.equalTo(10)
        }
        
        self.authorNameTF.snp.makeConstraints { (make) in
            make.top.equalTo(self.bookNameTF.snp.bottom).offset(10)
            make.left.equalTo(self.bookCoverBtn.snp.right).offset(10)
            make.right.equalTo(10)
            make.bottom.equalTo(self.bookCoverBtn.snp.bottom)
            make.height.equalTo(self.bookNameTF.snp.height)
        }
    }
}


extension MENewCommentTopView {

    // 设置子控件
    fileprivate func setupSubViews() {
    
        self.bookCoverBtn.setImage(UIImage(named: "Cover"), for: .normal)
        self.bookCoverBtn.addTarget(self, action: #selector(bookCoverClick), for: .touchUpInside)
        addSubview(self.bookCoverBtn)
        
        self.bookNameTF.placeholder = "书名"
        self.bookNameTF.floatingLabelFont = UIFont(name: My_Font_Name, size: 14)
        self.bookNameTF.floatingLabelTextColor = Main_Color
        self.bookNameTF.floatingLabelActiveTextColor = Main_Color
        addSubview(self.bookNameTF)
        
        self.authorNameTF.placeholder = "作者"
        self.authorNameTF.floatingLabelFont = UIFont(name: My_Font_Name, size: 14)
        self.authorNameTF.floatingLabelTextColor = Main_Color
        self.authorNameTF.floatingLabelActiveTextColor = Main_Color
        addSubview(self.authorNameTF)
        
    }
    
    @objc private func bookCoverClick() {
    
        delegate?.bookCoverBtnDidClick!()
    }
}
