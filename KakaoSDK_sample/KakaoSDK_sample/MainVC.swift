//
//  MainVC.swift
//  KakaoSDK_sample
//
//  Created by Lee Taeyoun on 2019/06/13.
//  Copyright © 2019 Sino. All rights reserved.
//

import UIKit

class MainVC: UITabBarController {

    @IBAction func touchUpLogout(_ sender: UIBarButtonItem) {
        KOSessionTask.unlinkTask(completionHandler: { [weak self] (success, error) -> Void in
            if let error = error as NSError? {
                UIAlertController.showMessage(error.description)
            } else {
                print("User unlink is successfully completed!")
                //_ = self?.navigationController?.popViewController(animated: true)
                //self?.dismiss(animated: true)
                self?.performSegue(withIdentifier: "unwindToIntro", sender: self)
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
