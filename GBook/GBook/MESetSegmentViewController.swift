//
//  MESetSegmentViewController.swift
//  GBook
//
//  Created by 马伟 on 2017/6/7.
//  Copyright © 2017年 马伟. All rights reserved.
//

import UIKit

class MESetSegmentViewController: MEBaseViewController {

    lazy var segmentControl1 = AKSegmentedControl(frame: CGRect.zero)
    lazy var segmentControl2 = AKSegmentedControl(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.groupTableViewBackground
        
    }
    
    override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()
        setupUI()

    }
    
    
    private func setupUI() {
    
        let leftTopBtn = view.viewWithTag(111) as! UIButton
        let rightTopBtn = view.viewWithTag(112) as! UIButton
        leftTopBtn.setTitleColor(RGB(r: 37, g: 82, b: 62), for: .normal)
        rightTopBtn.setTitleColor(RGB(r: 37, g: 82, b: 62), for: .normal)
        
        
        // add titleLabel
        let titleLbl = UILabel(frame: CGRect.zero)
        titleLbl.text = "选择书籍分类"
        titleLbl.textAlignment = .center
        titleLbl.font = UIFont(name: My_Font_Name, size: 15)
        titleLbl.shadowColor = UIColor.white
        titleLbl.shadowOffset = CGSize(width: 0.5, height: 1)
        titleLbl.textColor = RGB(r: 37, g: 82, b: 62)
        titleLbl.tag = 1111
        view.addSubview(titleLbl)
        
        titleLbl.snp.makeConstraints { (make) in
            make.left.equalTo(leftTopBtn)
            make.right.equalTo(rightTopBtn)
            make.height.equalTo(leftTopBtn.snp.height)
            make.centerY.equalTo(leftTopBtn)
            
            // add segment
            addSegmentControl()
        }
    }
    
    private func addSegmentControl() {
      
        let buttonArray1 = [
            ["image":"ledger","title":"文学","font":My_Font_Name],
            ["image":"drama masks","title":"人文社科","font":My_Font_Name],
            ["image":"aperture","title":"生活","font":My_Font_Name],
            ]
        
        let buttonArray2 = [
            ["image":"atom","title":"经管","font":My_Font_Name],
            ["image":"alien","title":"科技","font":My_Font_Name],
            ["image":"fire element","title":"网络流行","font":My_Font_Name],
            ]
        self.segmentControl1.initButton(withTitleandImage: buttonArray1)
        self.segmentControl2.initButton(withTitleandImage: buttonArray2)
        view.addSubview(segmentControl1)
        view.addSubview(segmentControl2)
        
        guard let titleLbl = view.viewWithTag(1111) else { return }
        self.segmentControl1.snp.makeConstraints { (make) in
            make.top.equalTo(titleLbl.snp.bottom).offset(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(37)
        }
        
        self.segmentControl2.snp.makeConstraints { (make) in
            make.top.equalTo(segmentControl1.snp.bottom).offset(10)
            make.left.equalTo(10)
            make.right.equalTo(-10)
            make.height.equalTo(37)
        }
        
        self.segmentControl1.addTarget(self, action: #selector(segmentControlAction(segment:)), for: .valueChanged)
        self.segmentControl2.addTarget(self, action: #selector(segmentControlAction(segment:)), for: .valueChanged)
}
    
    
    
    @objc private func segmentControlAction(segment : AKSegmentedControl) {
    
        print(segment.selectedIndexes)
        
        if segment == self.segmentControl1 {
            segmentControl2.setSelectedIndex(3)
            
            print("1")
        } else {
            segmentControl1.setSelectedIndex(3)
            print("2")
        }
    }
    
    
    
    
    
   
    
    
    @objc func rightButtonClick() {
        
        print("publish")
    }
    
}
