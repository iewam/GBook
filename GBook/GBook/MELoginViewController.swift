//
//  MELoginViewController.swift
//  GBook
//
//  Created by 马伟 on 2017/7/29.
//  Copyright © 2017年 马伟. All rights reserved.
//

import UIKit

// test IM flag
let TestIM_Flag = false

class MELoginViewController: MEBaseViewController {
    
    @IBOutlet weak var usernameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
   
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func login(_ sender: Any) {
        
    }
    
    @IBAction func register(_ sender: Any) {
        
        let storyboard = UIStoryboard.init(name: "Login", bundle: nil)
        let registerVC = storyboard.instantiateViewController(withIdentifier: "register")
        present(registerVC, animated: true, completion: nil)
    }

    
    deinit {
        print("loginViewController deinit")
    }
}
