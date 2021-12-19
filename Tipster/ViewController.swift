//
//  ViewController.swift
//  Tipster
//
//  Created by admin on 06/12/2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var receiptValue: UILabel!
    @IBOutlet weak var tipsSlider: UISlider!
    @IBOutlet weak var groupSizeSlider: UISlider!
    @IBOutlet weak var groupSizeLabel: UILabel!
    
    @IBOutlet weak var thiredPersent: UILabel!
    @IBOutlet weak var secondpersent: UILabel!
    @IBOutlet weak var fisrtPersnt: UILabel!
    
    @IBOutlet weak var tipPersentOne: UILabel!
    @IBOutlet weak var tipPersentTwo: UILabel!
    @IBOutlet weak var tipPersentThree: UILabel!
    
    @IBOutlet weak var personPersentOne: UILabel!
    @IBOutlet weak var personPersentTwo: UILabel!
    @IBOutlet weak var personPersentThree: UILabel!
    var groupSize: Int = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    func calaculateTip(value:Double){
        
        let p1 = Double(Int(tipsSlider.value))
        let p2 = p1 + 5.0
        let p3 = p2 + 5.0
        let v = value
        
        tipPersentOne.text = String(v * p1/100.0)
        tipPersentTwo.text = String(v * p2/100.0)
        tipPersentThree.text = String(v * p3/100.0)
        
        personPersentOne.text =  String( format: "%.2f" , v + v * p1/100.0 / Double(groupSize) )
        personPersentTwo.text =  String( format: "%.2f" , v + v * p2/100.0 / Double(groupSize) )
        personPersentThree.text = String( format: "%.2f" , v + v * p2/100.0 / Double(groupSize) )
        
    }
  
    
    @IBAction func tipSlider(_ sender: UISlider) {
        fisrtPersnt.text = String(Int(sender.value)) + "%"
        secondpersent.text = String(Int(sender.value)+5) + "%"
        thiredPersent.text = String(Int(sender.value)+10) + "%"
        
        if let value = receiptValue.text {
            calaculateTip(value: Double(value) ?? 0.0)
        }
    }
    
    @IBAction func groupSizeSlider(_ sender: UISlider) {
        groupSize = Int(sender.value)
        groupSizeLabel.text = "Group Size: \(groupSize)"
        if let value = receiptValue.text {
            calaculateTip(value: Double(value) ?? 0.0)
        }
        
    }
    
    
    @IBAction func numberPressed(_ sender: UIButton) {
        if let value = receiptValue.text {
            if sender.tag != 10 {
                if Double(value) == 0.0 {
                    receiptValue.text = String(sender.tag)
                    calaculateTip(value: Double(sender.tag))
                } else {
                    receiptValue.text = value + String(sender.tag)
                    calaculateTip(value: Double(receiptValue.text!) ?? 0.0)
                }
            }else {
                if Double(value) == 0.0 {
                    receiptValue.text = "."
                } else {
                    receiptValue.text = value + "."
                }
            }
        }//end unraping label
       
    }
    
    @IBAction func clearBtnPressed(_ sender: Any) {
        receiptValue.text = "0.0"
        if let value = receiptValue.text {
            calaculateTip(value: Double(value) ?? 0.0)
        }
    }
}

