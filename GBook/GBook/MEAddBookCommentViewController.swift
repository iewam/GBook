//
//  MEAddBookCommentViewController.swift
//  GBook
//
//  Created by 马伟 on 2017/6/7.
//  Copyright © 2017年 马伟. All rights reserved.
//

import UIKit
import JVFloatLabeledTextField

typealias MEAddBookCommentCallback = (_ bookComment : String)-> Void

class MEAddBookCommentViewController: MEBaseViewController {
    
    lazy var textView = JVFloatLabeledTextView(frame: CGRect.zero)
    var bookCommentCallback : MEAddBookCommentCallback?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.groupTableViewBackground
        
        setupUI()
        
        MEKeyboardManager.registerKeyboardWillShow(self)
        MEKeyboardManager.registerKeyboardWillHide(self)
    }
    
    @objc func keyboardWillShowNotification (_ noti : Notification) {
        
        let rect = MEKeyboardManager.returnKeyboardViewRect(noti)
        textView.contentInset = UIEdgeInsetsMake(0, 0, rect.size.height, 0)
    }

    @objc func keyboardWillHideNotification(_ noti : Notification) {
        textView.contentInset = UIEdgeInsets.zero
    }
    
    private func setupUI() {
    
        textView.delegate = self
        view.addSubview(textView)
        textView.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(64)
            make.left.equalTo(view).offset(15)
            make.bottom.equalTo(view).offset(-30)
            make.right.equalTo(view).offset(-15)
        }
    }
   
    
    @objc func rightButtonClick() {
        
        print("add book comment")
        if bookCommentCallback != nil {
            bookCommentCallback?(self.textView.text)
        }
        dismiss(animated: true, completion: nil)
    }

}

extension MEAddBookCommentViewController : UITextViewDelegate {

    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        textView.resignFirstResponder()
    }
}
