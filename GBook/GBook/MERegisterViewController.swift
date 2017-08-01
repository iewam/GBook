//
//  MERegisterViewController.swift
//  GBook
//
//  Created by 马伟 on 2017/7/29.
//  Copyright © 2017年 马伟. All rights reserved.
//

import UIKit

class MERegisterViewController: MEBaseViewController {

    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var usernameTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func register(_ sender: Any) {
        
        print("register")
    }
    
    
    @IBAction func close(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    

}
