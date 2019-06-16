//
//  SignInVC.swift
//  KakaoSDK_sample
//
//  Created by Lee Taeyoun on 2019/06/15.
//  Copyright © 2019 Sino. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {

    @IBAction func login(_ sender: AnyObject) {
        let session: KOSession = KOSession.shared();
        
        if session.isOpen() {
            session.close()
        }
        
        session.open(completionHandler: { (error) -> Void in
            
            if !session.isOpen() {
                if let error = error as NSError? {
                    switch error.code {
                    case Int(KOErrorCancelled.rawValue):
                        break
                    default:
                        UIAlertController.showMessage(error.description)
                    }
                }
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
}
