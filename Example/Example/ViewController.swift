//
//  ViewController.swift
//  Example
//
//  Created by DUNGNGUYEN on 8/28/21.
//

import UIKit
import CLLocalization

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func changeLanguageButtonPressed(_ sender: Any) {
        let alertController = UIAlertController.init(title: nil, message: nil, preferredStyle: .alert)
        for code in CLLocalization.supportedLanguages {
            let action = UIAlertAction.init(title: code.localized, style: .default, handler: { (_) in
                CLLocalization.setLanguage(code)
            })
            alertController.addAction(action)
        }
        let action = UIAlertAction.init(title: "device_language".localized, style: .default, handler: { (_) in
            CLLocalization.setLanguage(nil)
        })
        alertController.addAction(action)
        alertController.title = "change_language".localized
        alertController.addAction(UIAlertAction.init(title: "cancel".localized, style: .destructive, handler: { (_) in
            
        }))
        self.present(alertController, animated: true, completion: nil)
    }
    
}

