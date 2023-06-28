//
//  ViewController.swift
//  myPinCode
//
//  Created by Каламкас on 19.06.2023.
//

import UIKit

class ViewController: UIViewController {
    let correctPin = "1234"
    var input = "" {
        didSet {
            fillCircles()
        }
    }

    @IBOutlet weak var circle1: UIImageView!
    @IBOutlet weak var circle2: UIImageView!
    @IBOutlet weak var circle3: UIImageView!
    @IBOutlet weak var circle4: UIImageView!
    
    lazy var circles = [circle1, circle2, circle3, circle4]

    @IBAction func backspaceTapped(_ sender: Any) {
        guard input.count > 0 else {
            return
        }
        
        input.removeLast()
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        if let button = sender as? UIButton {
            input.append(String(button.tag))
            
            if input.count == 4 {
                if input == correctPin {
                    showAlert(message: "пин-код верный")
                } else {
                    showAlert(message: "пин-код неверный")
                }
            }
        }
    }
}

private extension ViewController {
    func showAlert(message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: { _ in self.input = "" })
        alertController.addAction(action)
        self.present(alertController, animated: true)
    }
    
    func fillCircles() {
        for circle in circles {
            circle?.image = UIImage(systemName: "circle")
        }
        
        for (i, _) in input.enumerated() {
            circles[i]?.image = UIImage(systemName: "circle.fill")
        }
    }
}
