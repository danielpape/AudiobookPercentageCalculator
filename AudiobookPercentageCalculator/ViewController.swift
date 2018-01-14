//
//  ViewController.swift
//  AudiobookPercentageCalculator
//
//  Created by Daniel Pape on 14/01/2018.
//  Copyright © 2018 Daniel Pape. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    

    @IBOutlet weak var ProgressPicker: UIPickerView!
    @IBOutlet weak var TotalPicker: UIPickerView!
    
    @IBOutlet weak var PercentageLabel: UILabel!
    var pickerDataSource = [["0","1", "2", "3", "4","5", "6", "7", "8","9","10",
                             "11", "12", "13", "14","15", "16", "17", "18","19","20",
                             "21", "22", "23", "24","25", "26", "27", "28","29","30",
                             "31", "32", "33", "34","35", "36", "37", "38","39","40",
                             "41", "42", "43", "44","45", "46", "47", "48","49","50",
                             "51", "52", "53", "54","55", "56", "57", "58","59","60",],
                            ["0","1", "2", "3", "4","5", "6", "7", "8","9","10",
                             "11", "12", "13", "14","15", "16", "17", "18","19","20",
                             "21", "22", "23", "24","25", "26", "27", "28","29","30",
                             "31", "32", "33", "34","35", "36", "37", "38","39","40",
                             "41", "42", "43", "44","45", "46", "47", "48","49","50",
                             "51", "52", "53", "54","55", "56", "57", "58","59"],
                            ["0","1", "2", "3", "4","5", "6", "7", "8","9","10",
                             "11", "12", "13", "14","15", "16", "17", "18","19","20",
                             "21", "22", "23", "24","25", "26", "27", "28","29","30",
                             "31", "32", "33", "34","35", "36", "37", "38","39","40",
                             "41", "42", "43", "44","45", "46", "47", "48","49","50",
                             "51", "52", "53", "54","55", "56", "57", "58","59"]];
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.ProgressPicker.dataSource = self;
        self.ProgressPicker.delegate = self;
        
        self.TotalPicker.dataSource = self;
        self.TotalPicker.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerDataSource[component].count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerDataSource[component][row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        var ProgressHours = ProgressPicker.selectedRow(inComponent: 0) as Int
        var ProgressMinutes = ProgressPicker.selectedRow(inComponent: 1) as Int
        var ProgressSeconds = ProgressPicker.selectedRow(inComponent: 2) as Int
        
        var TotalProgress:Double = Double((ProgressHours*60*60)+(ProgressMinutes*60)+ProgressSeconds)
        
        var TotalHours = TotalPicker.selectedRow(inComponent: 0) as Int
        var TotalMinutes = TotalPicker.selectedRow(inComponent: 1) as Int
        var TotalSeconds = TotalPicker.selectedRow(inComponent: 2) as Int
        
        var TotalTotal:Double = Double((TotalHours*60*60)+(TotalMinutes*60)+TotalSeconds)
        
        print("\(TotalProgress) completed of \(TotalTotal)")
        
        var percentage = calculatePercentage(firstValue: TotalProgress, secondValue: TotalTotal)

        self.PercentageLabel.text = "\(percentage)%"
    }
    
    func calculatePercentage(firstValue:Double,secondValue:Double) -> Int {
        
        var percentage = Int(firstValue/secondValue * 100)
        
        return percentage
    }
    
}

