//
//  ViewController.swift
//  Light App
//
//  Created by Joshua Dance on 9/19/17.
//  Copyright © 2017 Joshua Dance. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var offButton: UIButton!
    @IBOutlet weak var lightOffLabel: UILabel!
    
    var switchStatus: SwitchStatus = SwitchStatus.off
    var darkMode = true
    var darkGrey = UIColor(red: 92/255, green: 92/255, blue: 92/255, alpha: 1)
    var white = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func buttonWasTapped(_ sender: Any) {
        switchStatus.toggle()
        darkMode = !darkMode
        changeMode()
    }
    
    func changeMode() {
        if switchStatus == .off {
            view.backgroundColor = #colorLiteral(red: 0.3607416153, green: 0.3608088493, blue: 0.3607373834, alpha: 1)
            lightOffLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            lightOffLabel.text = "OFF 🌚"
            offButton.setImage(UIImage(named: "offBtn")!, for: .normal)
            toggleTorch(on: false)
        } else {
            view.backgroundColor = white
            lightOffLabel.textColor = darkGrey
            lightOffLabel.text = "ON 🌝"
            offButton.setImage(UIImage(named: "onBtn")!, for: .normal)
            toggleTorch(on: true)
        }
    } //end changeMode
    
    func toggleTorch(on: Bool) {
        //guard let device = AVCaptureDevice.defaultDevice(withMediaType: AVMediaTypeVideo) else { return }
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else {return}
        
        if device.hasTorch {
            do {
                try device.lockForConfiguration()
                
                if on == true {
                    device.torchMode = .on
                } else {
                    device.torchMode = .off
                }
                
                device.unlockForConfiguration()
            } catch {
                print("Torch could not be used")
            } //end do catch
        } else {
            print("Torch is not available")
        } //end check for torch
    } //end of toggleTorch
}

