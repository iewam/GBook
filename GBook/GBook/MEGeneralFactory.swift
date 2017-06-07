//
//  MEGeneralFactory.swift
//  GBook
//
//  Created by 马伟 on 2017/6/6.
//  Copyright © 2017年 马伟. All rights reserved.
//

import UIKit

let ME_FunctionalButton_Top_Margin : CGFloat = 30.0
let ME_FunctionalButton_Height : CGFloat = 20.0
let ME_FunctionalButton_Width : CGFloat = 40.0

class MEGeneralFactory: NSObject {
    
    //MARK: 设置常见的功能性按钮（关闭和确认）
    static func setupNormalFunctionalButton(_ forTarget : UIViewController , leftTitle : String = "关闭", rightTitle : String = "确认") {
    
        let leftBtn = UIButton(frame: CGRect(x: 10, y: ME_FunctionalButton_Top_Margin, width: ME_FunctionalButton_Width, height: ME_FunctionalButton_Height))
        leftBtn.setTitle(leftTitle, for: .normal)
        leftBtn.setTitleColor(Main_Color, for: .normal)
        leftBtn.contentHorizontalAlignment = .left
        leftBtn.titleLabel?.font = UIFont(name: My_Font_Name, size: 14)
        leftBtn.addTarget(forTarget, action: Selector(("leftButtonClick")), for: .touchUpInside)
        forTarget.view.addSubview(leftBtn)
        
        let rightBtn = UIButton(frame: CGRect(x: SCREEN_WIDTH - 50, y: ME_FunctionalButton_Top_Margin, width: ME_FunctionalButton_Width, height: ME_FunctionalButton_Height))
        rightBtn.setTitle(rightTitle, for: .normal)
        rightBtn.setTitleColor(Main_Color, for: .normal)
        rightBtn.contentHorizontalAlignment = .left
        rightBtn.titleLabel?.font = UIFont(name: My_Font_Name, size: 14)
        rightBtn.addTarget(forTarget, action: Selector(("rightButtonClick")), for: .touchUpInside)
        forTarget.view.addSubview(rightBtn)
    }

}
