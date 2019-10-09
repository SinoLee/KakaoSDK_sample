//
//  IntroVC.swift
//  KakaoSDK_sample
//
//  Created by Lee Taeyoun on 2019/06/15.
//  Copyright © 2019 Sino. All rights reserved.
//

import UIKit
import UserNotifications

class IntroVC: UIViewController {

    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBAction func unwindToIntro(segue: UIStoryboardSegue) {
        print("UnwindToLogIn State")
        if let segue = segue as? UIStoryboardSegueWithCompletion {
            print("UnwindToLogIn : SegueWithCOmpletion")
            segue.completion = {
                self.showLogin()
            }
        }
    }
    @IBAction func touchUpIntroView(_ sender: UIView) {
        showLogin()
    }
    

    private var waitTimer = Timer()
    private var hideStatusBar: Bool = true {
        didSet {
            UIView.animate(withDuration: 0.5) {
                self.setNeedsStatusBarAppearanceUpdate()
                self.backgroundImage.alpha = 1.0
            }
        }
    }
    private var isOpened: Bool {
        return KOSession.shared()?.isOpen() ?? false
    }
    
    override var prefersStatusBarHidden: Bool {
        return hideStatusBar
    }
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default //.lightContent
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        hideStatusBar = !hideStatusBar
        waitTimer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(showLogin), userInfo: nil, repeats: false)
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
    // MARK: -
    @objc func showLogin() {
        print("is Opened : \(isOpened)")
        let identifier = isOpened ? "ShowMainFromIntro" : "ShowSignInFromIntro"
        performSegue(withIdentifier: identifier, sender: self)
    }
}
