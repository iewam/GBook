//
//  MESetSegmentViewController.swift
//  GBook
//
//  Created by 马伟 on 2017/6/7.
//  Copyright © 2017年 马伟. All rights reserved.
//

import UIKit

typealias MESegmentCallback = (_ segmentCallback : String) -> Void

class MESetSegmentViewController: MEBaseViewController {

    lazy var segmentControl1 = AKSegmentedControl(frame: CGRect.zero)
    lazy var segmentControl2 = AKSegmentedControl(frame: CGRect.zero)
    
    var literatureArray1:Array<NSDictionary> = []
    var literatureArray2:Array<NSDictionary> = []
    
    
    var humanitiesArray1:Array<NSDictionary> = []
    var humanitiesArray2:Array<NSDictionary> = []
    
    
    var livelihoodArray1:Array<NSDictionary> = []
    var livelihoodArray2:Array<NSDictionary> = []
    
    
    var economiesArray1:Array<NSDictionary> = []
    var economiesArray2:Array<NSDictionary> = []
    
    
    var technologyArray1:Array<NSDictionary> = []
    var technologyArray2:Array<NSDictionary> = []
    
    var NetworkArray1:Array<NSDictionary> = []
    var NetworkArray2:Array<NSDictionary> = []
    
    
    lazy var dropMenu1 = IGLDropDownMenu()
    lazy var dropMenu2 = IGLDropDownMenu()

    var callbackText : String = ""
    var segmentCallback : MESegmentCallback?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.groupTableViewBackground
        
       
        
    }
    
    override func viewDidLayoutSubviews() {
         super.viewDidLayoutSubviews()
        setupUI()
        initDropMenuDataSource()
        setupDropMenu()
        
        //默认选中第一个
        self.segmentControl1.setSelectedIndex(0)
        segmentControlAction(segment: self.segmentControl1)
    }
    
    
    
    
    
    @objc func rightButtonClick() {
        
        print("segment")
        if (segmentCallback != nil) {
            segmentCallback!(callbackText)
        }
        dismiss(animated: true, completion: nil)
    }
    
    deinit {
        print("MESetSegmentViewController deinit")
    }
    
}

//MARK:------ dorp menu ------
extension MESetSegmentViewController : IGLDropDownMenuDelegate {

    fileprivate func initDropMenuDataSource() {
    
        self.literatureArray1 = [
            ["title":"小说"],
            ["title":"漫画"],
            ["title":"青春文学"],
            ["title":"随笔"],
            ["title":"现当代诗"],
            ["title":"戏剧"],
        ];
        self.literatureArray2 = [
            ["title":"传记"],
            ["title":"古诗词"],
            ["title":"外国诗歌"],
            ["title":"艺术"],
            ["title":"摄影"],
        ];
        self.humanitiesArray1 = [
            ["title":"历史"],
            ["title":"文化"],
            ["title":"古籍"],
            ["title":"心理学"],
            ["title":"哲学/宗教"],
            ["title":"政治/军事"],
        ];
        self.humanitiesArray2 = [
            ["title":"社会科学"],
            ["title":"法律"],
        ];
        self.livelihoodArray1 = [
            ["title":"休闲/爱好"],
            ["title":"孕产/胎教"],
            ["title":"烹饪/美食"],
            ["title":"时尚/美妆"],
            ["title":"旅游/地图"],
            ["title":"家庭/家居"],
        ];
        self.livelihoodArray2 = [
            ["title":"亲子/家教"],
            ["title":"两性关系"],
            ["title":"育儿/早教"],
            ["title":"保健/养生"],
            ["title":"体育/运动"],
            ["title":"手工/DIY"],
        ];
        self.economiesArray1  = [
            ["title":"管理"],
            ["title":"投资"],
            ["title":"理财"],
            ["title":"经济"],
        ];
        self.economiesArray2  = [
            ["title":"没有更多了"],
        ];
        self.technologyArray1 =  [
            ["title":"科普读物"],
            ["title":"建筑"],
            ["title":"医学"],
            ["title":"计算机/网络"],
        ];
        self.technologyArray2 = [
            ["title":"农业/林业"],
            ["title":"自然科学"],
            ["title":"工业技术"],
        ];
        self.NetworkArray1 =    [
            ["title":"玄幻/奇幻"],
            ["title":"武侠/仙侠"],
            ["title":"都市/职业"],
            ["title":"历史/军事"],
        ];
        self.NetworkArray2 =    [
            ["title":"游戏/竞技"],
            ["title":"科幻/灵异"],
            ["title":"言情"],
        ];

    }
    
    fileprivate func setupDropMenu() {
    
        self.dropMenu1.menuText = "点我，显示详情列表"
        self.dropMenu1.menuButton.textLabel.adjustsFontSizeToFitWidth = true
        self.dropMenu1.menuButton.textLabel.textAlignment = .center
        self.dropMenu1.paddingLeft = 15
        self.dropMenu1.itemAnimationDelay = 0.1
        self.dropMenu1.type = .stack
        self.dropMenu1.gutterY = 5
        self.dropMenu1.delegate = self
        self.dropMenu1.frame = CGRect(x: 10, y: 160, width: SCREEN_WIDTH/2-20, height: 50)
        view.addSubview(dropMenu1)

        
        self.dropMenu2.menuText = "点我，显示详情列表"
        self.dropMenu2.menuButton.textLabel.adjustsFontSizeToFitWidth = true
        self.dropMenu2.menuButton.textLabel.textAlignment = .center
        self.dropMenu2.paddingLeft = 15
        self.dropMenu2.itemAnimationDelay = 0.1
        self.dropMenu2.type = .stack
        self.dropMenu2.gutterY = 5
        self.dropMenu2.delegate = self
        self.dropMenu2.frame = CGRect(x: SCREEN_WIDTH/2+10, y: 160, width: SCREEN_WIDTH/2-20, height: 50)
        view.addSubview(dropMenu2)
        
        
        dropMenu1.reloadView()
        dropMenu2.reloadView()
    }

    
    func dropDownMenu(_ dropDownMenu: IGLDropDownMenu!, selectedItemAt index: Int) {
        
        print(dropDownMenu.dropDownItems[index], index)
        guard let selectText = (dropDownMenu.dropDownItems[index] as! IGLDropDownItem).text else { return }
        if dropDownMenu == dropMenu1 {
            callbackText = selectText
        } else {
            callbackText = callbackText + selectText
        }
    }
}



//MARK:------ segment ------
extension MESetSegmentViewController {

    fileprivate func setupUI() {
        
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
    
    
    
    @objc fileprivate func segmentControlAction(segment : AKSegmentedControl) {
        
        guard var index = segment.selectedIndexes.first?.hashValue else {return}
        
        if segment == self.segmentControl1 {
            segmentControl2.setSelectedIndex(3)
        
        } else {
            segmentControl1.setSelectedIndex(3)
            index += 3
        }
        
//        self.dropMenu1.resetParams()
//        self.dropMenu2.resetParams()
        
        switch index {
        case 0:
            
            setItemsForDropMenu(typeArr: literatureArray1, detailTypeArr: literatureArray2)
            
            break
        case 1:
            setItemsForDropMenu(typeArr: humanitiesArray1, detailTypeArr: humanitiesArray2)
            break
        case 2:
            setItemsForDropMenu(typeArr: livelihoodArray1, detailTypeArr: livelihoodArray2)
            break
        case 3:
            setItemsForDropMenu(typeArr: economiesArray1, detailTypeArr: economiesArray2)
            break
        case 4:
            setItemsForDropMenu(typeArr: technologyArray1, detailTypeArr: technologyArray2)
            break
        case 5:
            setItemsForDropMenu(typeArr: NetworkArray1, detailTypeArr: NetworkArray2)
            break
        default:
            break
        }
        
        self.dropMenu1.reloadView()
        self.dropMenu2.reloadView()
        
    }
    
    
    private func setItemsForDropMenu(typeArr: Array<NSDictionary>, detailTypeArr: Array<NSDictionary>) {
        
        var typeItems = [Any]()
        for dic in typeArr {
        
            let item = IGLDropDownItem()
            item.text = dic["title"] as? String
            typeItems.append(item)
            
        }
        
        var detailTypeItems = [Any]()
        for dic in detailTypeArr {
            let item = IGLDropDownItem()
            item.text = dic["title"] as? String
            detailTypeItems.append(item)
        }
        
        self.dropMenu1.dropDownItems = typeItems
        self.dropMenu2.dropDownItems = detailTypeItems
    }
    
    
}
