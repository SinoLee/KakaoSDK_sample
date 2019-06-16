//
//  UIStoryboardSegueWithCompletion.swift
//  KakaoSDK_sample
//
//  Created by Lee Taeyoun on 2019/06/15.
//  Copyright © 2019 Sino. All rights reserved.
//

import UIKit

class UIStoryboardSegueWithCompletion: UIStoryboardSegue {
    
    var completion: (() -> Void)?
    
    override func perform() {
        super.perform()
        
        if let completion = completion {
            completion()
        }
    }

}
