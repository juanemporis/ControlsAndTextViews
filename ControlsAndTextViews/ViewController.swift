//
//  ViewController.swift
//  ControlsAndTextViews
//
//  Created by wendy manrique on 17/04/22.
//

import UIKit

class ViewController: UIViewController {

    //OUTLETS
    @IBOutlet weak var myButton: UIButton!  // (1-1)
    @IBOutlet weak var myPickerView: UIPickerView!  //(2-1)
    @IBOutlet weak var myPageControll: UIPageControl! //(3-1)
    @IBOutlet weak var mySegmentedControl: UISegmentedControl! //(4-1)
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var myStepper: UIStepper!
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var myProgressView: UIProgressView!
    @IBOutlet weak var myActivityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var myStepperLabel: UILabel!
    @IBOutlet weak var mySwitchLabel: UILabel!
    
    //VARIABLES
    private let myPickerViewValues = ["Uno","Dos","Tres","Cuatro","Cinco"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //BUTTON
        myButton.setTitle("Mi Boton", for: .normal) //(1-2)
        myButton.backgroundColor = .blue
        myButton.setTitleColor(.white, for: .normal)
        
        //PICKERS
        myPickerView.backgroundColor = .lightGray  //(2-2)
        myPickerView.dataSource = self
        myPickerView.delegate = self
        myPickerView.isHidden = true
        
        //PAGE CONTROLS
        myPageControll.numberOfPages = myPickerViewValues.count //(4-2)
        myPageControll.currentPageIndicatorTintColor = .blue
        myPageControll.pageIndicatorTintColor = .lightGray
        
        //SEGMENTED CONTROLS
        
        mySegmentedControl.removeAllSegments()
        for (index, value) in myPickerViewValues.enumerated() {
        mySegmentedControl.insertSegment(withTitle: value, at: index, animated: true)
            
            //SLIDERS
            mySlider.minimumTrackTintColor = .red
            mySlider.minimumValue = 1
            mySlider.maximumValue = Float(myPickerViewValues.count)
            mySlider.value = 1
            
            //STEPPER
            myStepper.minimumValue = 1
            myStepper.maximumValue = Double(myPickerViewValues.count)
            
            //SWTICH
            mySwitch.onTintColor = .purple
            mySwitch.isOn = false
            
            //PROGRESS INDICATORS
            
            myProgressView.progress = 0
            myActivityIndicator.color = .orange
            myActivityIndicator.startAnimating()
            myActivityIndicator.hidesWhenStopped = true
            
            //LABELS
            myStepperLabel.textColor = .darkGray
            myStepperLabel.font = UIFont.boldSystemFont(ofSize: 20)
            myStepperLabel.text = "1"
            
            mySwitchLabel.text = "Esta apagado"
            
    }
}
    //ACTIONS
    
    @IBAction func myButtonActions(_ sender: Any) {   //(1-3)
        if myButton.backgroundColor == .blue{
            myButton.backgroundColor = .green
        }else{
            myButton.backgroundColor = .blue
        }
    }
    @IBAction func myPageControllAction(_ sender: Any){  //(3-2)
        
        myPickerView.selectRow(myPageControll.currentPage, inComponent: 0, animated: true)
        
        let myString =
        myPickerViewValues[myPageControll.currentPage]
        myButton.setTitle(myString, for: .normal)
        
        mySegmentedControl.selectedSegmentIndex = myPageControll.currentPage
    }
    @IBAction func mySegmentControlAction(_ sender: Any) { //(4-3)
        
        myPickerView.selectRow(mySegmentedControl.selectedSegmentIndex, inComponent: 0, animated: true)
        
        let myString =
        myPickerViewValues[mySegmentedControl.selectedSegmentIndex]
        myButton.setTitle(myString, for: .normal)
        
        myPageControll.currentPage = mySegmentedControl.selectedSegmentIndex
        
    }
    @IBAction func mySliderAction(_ sender: Any) {
        
        var progress: Float = 0
        
        switch mySlider.value {
        case 1..<2:
            mySegmentedControl.selectedSegmentIndex = 0
            progress = 0.2
        case 2..<3:
            mySegmentedControl.selectedSegmentIndex = 1
            progress = 0.4
        case 3..<4:
            mySegmentedControl.selectedSegmentIndex = 2
            progress = 0.6
        case 4..<5:
            mySegmentedControl.selectedSegmentIndex = 3
            progress = 0.8
        default:
            mySegmentedControl.selectedSegmentIndex = 4
            progress = 1
        }
        
        myProgressView.progress = progress
    }
    @IBAction func myStepperAction(_ sender: Any) {
        let value = myStepper.value
        mySlider.value = Float(value)
        
        myStepperLabel.text = "\(value)"
    }
    @IBAction func mySwitchAction(_ sender: Any) {
        
        if mySwitch.isOn {
            myPickerView.isHidden = false
            myActivityIndicator.stopAnimating()
            
            mySwitchLabel.text = "Esta encendido"
        }else{
            myPickerView.isHidden = true
            myActivityIndicator.startAnimating()
            
            mySwitchLabel.text = "Esta apagado"
        }
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //(2-3)
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return myPickerViewValues.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return myPickerViewValues[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let myString = myPickerViewValues[row]
        myButton.setTitle(myString, for: .normal)
        
            
        
        myPageControll.currentPage = row
        
        mySegmentedControl.selectedSegmentIndex = row
        
        

    }
    
}


