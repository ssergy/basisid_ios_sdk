//
//  ViewController.swift
//  Swift-Example
//
//  Created by Sergey Shcherbak on 11.10.2021.
//

import UIKit
import BasisIDSdk

class ViewController: UIViewController {
    
    private lazy var button: UIButton = {
            let button = UIButton(type: .custom)
            button.setTitle("Start!", for: .normal)
            button.setTitleColor(.blue, for: .normal)
            button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
            return button
        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func callback(_ status: String, _ code: String) {
        print(status, code)
        switch status {
        // ok status
        case "ok":
            switch code {
            case "video":
                print("first step completed")
            case "full":
                print("verification completed")
            default:
                break
            }
        // error status
        case "error":
            switch code {
            case "api":
                print("api system error")
            case "step_timeout":
                print("verification step timeout exceed")
            case "manual_review":
                print("profile sent to manual review")
            default:
                break
            }
        default:
            break
        }
    }

    @objc private func buttonClick(_: UIButton) {
        let sdkBasisID = BasisIDSdk.initBasisID(
            apiKey: "prod-VeiSnSqJqqbnwxkFMViqTslblyiJaXFX",
            apiFormToken: "2fdc6057-7400-48b7-8f86-3841dbc202b0",
            region: "europe",
            callback: callback
        )
        self.present(sdkBasisID, animated: true, completion: nil)
    }
}

