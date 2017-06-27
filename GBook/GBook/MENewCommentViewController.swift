//
//  MENewCommentViewController.swift
//  GBook
//
//  Created by 马伟 on 2017/6/6.
//  Copyright © 2017年 马伟. All rights reserved.
//

import UIKit

let topViewHeight : CGFloat = 180.0
let topView_topMargin : CGFloat = 60.0
let reuseIdentifier = "cell"

class MENewCommentViewController: MEBaseViewController {

    lazy var topView = MENewCommentTopView(frame: CGRect(x: 0, y: topView_topMargin, width: SCREEN_WIDTH, height: topViewHeight))
    lazy var imgPicker = UIImagePickerController()
    
    lazy var tableView = UITableView(frame: CGRect(x: 0, y: topViewHeight + topView_topMargin + 20, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - topView_topMargin - topViewHeight - 20), style: .grouped)
    
    var titleArr : [String]?
    
    var commentTitle : String?// 书评标题
    var score : LDXScore {
    
        let score = LDXScore(frame: CGRect(x: 10, y: 10, width: SCREEN_WIDTH - 20, height: 22))
        score.normalImg = UIImage(named: "btn_star_evaluation_normal")
        score.highlightImg = UIImage(named: "btn_star_evaluation_press")
        score.isSelect = true
        score.max_star = 5
        score.show_star = 5
        return score
    } //评分控件
    
    var showScore = false
    
    var segmentDetailText : String?
    var bookCommentText : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleArr = ["标题", "评分", "分类", "书评"]
        
        setupUI()
        
    }
    
    private func setupUI() {
    
        self.topView.delegate = self
        view.addSubview(self.topView)
        
        self.tableView.backgroundColor = UIColor.groupTableViewBackground
        self.tableView.tableFooterView = UIView()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(self.tableView)
    }
   
 
    
    
    @objc func rightButtonClick() {
        
        print("publish")
    }
    
    deinit {
        print("MENewCommentViewController deinit")
    }
}

//MARK:------ UITableViewDelegate ------
extension MENewCommentViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (titleArr?.count)!
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell =  UITableViewCell(style: .value1, reuseIdentifier: reuseIdentifier)
        cell.selectionStyle = .none
        cell.textLabel?.text = titleArr?[indexPath.row]
        cell.textLabel?.font = UIFont(name: My_Font_Name, size: 15)
        cell.detailTextLabel?.font = UIFont(name: My_Font_Name, size: 13)
    
        if indexPath.row != 1 {
        
            cell.accessoryType = .disclosureIndicator
        }
        guard let cellText = cell.textLabel?.text else {return cell}
        switch cellText {
        case "标题":
            cell.detailTextLabel?.text = commentTitle
            break
            
        case "":
            if self.showScore {
                cell.contentView.addSubview(self.score)
                cell.accessoryType = .none
            }
            break
            
        case "分类":
            cell.detailTextLabel?.text = self.segmentDetailText
            break
            
        case " ":
            cell.accessoryType = .none
            let commentView = UITextView(frame: CGRect(x: 4, y: 4, width: SCREEN_WIDTH - 8, height: 80))
            commentView.text = self.bookCommentText
            commentView.font = UIFont(name: My_Font_Name, size: 15)
            commentView.isEditable = false
            cell.contentView.addSubview(commentView)
            break
            
        default:
            
            break
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      
        if showScore && indexPath.row >= 5 {
            return 88
        } else if !showScore && indexPath.row >= 4 {
            return 88
        }
        return 44
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        guard let cellText = cell?.textLabel?.text else { return }
        switch cellText {
        case "标题":
            
            setCommentTitle()
            break
        case "评分":
            
            setScore()
            break
        case "分类":
            
            setSegment()
            break
        case "书评":
            
            addBookComment()
            break
        default:
            break
        }
    }
    
    
    //MARK: 设置书评标题
    private func setCommentTitle() {
    
        let setCommenttitleVC = MENewCommentSetTitleViewController()
        MEGeneralFactory.setupNormalFunctionalButton(setCommenttitleVC)
        
        setCommenttitleVC.callback = {(title) in
        
            self.commentTitle = title
            self.tableView.reloadData()
        }
        
        present(setCommenttitleVC, animated: true, completion: nil)
    }
    
    //MARK: 设置评分
    private func setScore() {
    
        self.tableView.beginUpdates()
        
        if self.showScore {
            
            self.showScore = false
            self.titleArr?.remove(at: 2)
            let insertIndexPaths = [IndexPath(row: 2, section: 0)]
            self.tableView.deleteRows(at: insertIndexPaths, with: .right)
        
        } else {
        
            self.showScore = true
            self.titleArr?.insert("", at: 2)
            let insertIndexPaths = [IndexPath(row: 2, section: 0)]
            self.tableView.insertRows(at: insertIndexPaths, with: .left)
            
        }
        
        self.tableView.endUpdates()
    }
    
    
    //MARK: 选择分类
    private func setSegment() {
    
        let segmentVC = MESetSegmentViewController()
        MEGeneralFactory.setupNormalFunctionalButton(segmentVC)
        segmentVC.segmentCallback = {(segmentText) in
        
            self.segmentDetailText = segmentText
            self.tableView.reloadData()
        }
        present(segmentVC, animated: true, completion: nil)
    }
    
    //MARK: 添加书评
    private func addBookComment() {
    
        let addBookCommentVC = MEAddBookCommentViewController()
        MEGeneralFactory.setupNormalFunctionalButton(addBookCommentVC)
        addBookCommentVC.textView.text = self.bookCommentText
        addBookCommentVC.bookCommentCallback = {(bookCommet) in
            self.bookCommentText = bookCommet
            if self.titleArr?.last == " " {
                self.titleArr?.removeLast()
            }
            
            if self.bookCommentText != "" {
                
                self.titleArr?.append(" ")
            }
            self.tableView.reloadData()
        }
        present(addBookCommentVC, animated: true, completion: nil)
    }
}


//MARK:------ MENewCommentTopViewDelegate ------

extension MENewCommentViewController : MENewCommentTopViewDelegate {

    func bookCoverBtnDidClick() {
        print("chose book")
        
        self.imgPicker.delegate = self
        
        let alert = UIAlertController(title: "选择图片", message: nil, preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "拍摄", style: .default, handler: { (_) in
            
           self.takePhoto()
            
        }))
    
        alert.addAction(UIAlertAction(title: "从相册选择", style: .default, handler: { (_) in
            
            
            self.choosePhotoFromPhotoLibrary()
        }))
        
        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: { (_) in
            
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
    
    
    private func choosePhotoFromPhotoLibrary() {
    
        self.imgPicker.sourceType = .photoLibrary
        self.present(self.imgPicker, animated: true, completion: nil)
    }
    
    
    private func takePhoto() {
      
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            
            print("camera")
            
            self.imgPicker.sourceType = .camera
            self.present(self.imgPicker, animated: true, completion: nil)

            
        } else {
            
            let tipAlert = UIAlertController(title: "tip", message: "no camera", preferredStyle: .alert)
            tipAlert.addAction(UIAlertAction(title: "sure", style: .default, handler: { (_) in
                
            }))
            
            self.present(tipAlert, animated: true, completion: nil)
        }
    }
    
}


//MARK:------ UIImagePickerControllerDelegate ------

extension MENewCommentViewController : UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        self.imgPicker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {

        self.imgPicker.dismiss(animated: true) {
            
            let image = info["UIImagePickerControllerOriginalImage"] as! UIImage
            self.topView.bookCoverBtn.setImage(image, for: .normal)
            
        }
        
    }
}




