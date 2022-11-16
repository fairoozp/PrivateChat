//
//  LoginPage.swift
//  PrivateChatStoryBoard
//
//  Created by Fairooz P on 16/11/22.
//

import Foundation
import UIKit

class LoginPage: UIViewController {

    
    @IBOutlet weak var getOTP: UIButton!
    @IBOutlet weak var otp: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var fieldHeight: NSLayoutConstraint!
    @IBOutlet weak var fieldView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonContinue(_ sender: Any) {
        if getOTP.titleLabel?.text == "Get OTP" {
            if (phoneNumber.text == "") {
                phoneNumber.attributedPlaceholder = NSAttributedString(
                    string: "Phone Number Required", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            } else {
                getOTP.setTitle("Verify", for: .normal)
                otp.isHidden = false
                fieldHeight.constant = 90
            }
        } else {
            if (phoneNumber.text == "") {
                phoneNumber.attributedPlaceholder = NSAttributedString(
                    string: "Phone Number Required", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            }
            else if (otp.text == "") {
                otp.attributedPlaceholder = NSAttributedString(
                    string: "OTP Required", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            } else {
                getOTP.titleLabel?.textColor = UIColor.green
            }
        }
    }
    
}

