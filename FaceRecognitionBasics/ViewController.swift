//
//  ViewController.swift
//  FaceRecognitionBasics
//
//  Created by Alican Kurt on 13.08.2021.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    
    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInButtonClick(_ sender: Any) {
        // Activating Face Recognizer
        
        let authContext = LAContext()
        var error : NSError?
        
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it You?") { success, error in
                if success == true{
                    // successful auth
                    // Must be run Async
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toSignedVC", sender: nil)
                    }                    
                }else{
                    // Must be run Async = DispatchQueue.main.async
                    DispatchQueue.main.async {
                        self.testLabel.text = "Error!"
                    }
                    
                }
            }
            
        }
        
        
    }
    
}

