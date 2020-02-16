//
//  MonthYearPicker.swift
//  YesplanVIP
//
//  Created by Tom Slegers on 13/02/2020.
//  Copyright © 2020 Yesplan. All rights reserved.
//

//
//  MonthYearPicker.swift
//
//  Created by Ben Dodson on 15/04/2015.
//  Modified by Jiayang Miao on 24/10/2016 to support Swift 3
//  Modified by David Luque on 24/01/2018 to get default date
//
import UIKit

class YearPickerView: UIPickerView, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var years: [Int]!
    var year = Calendar.current.component(.year, from: Date()) {
        didSet {
//            print("didset: ", year)
            selectRow(years.firstIndex(of: year)!, inComponent: 0, animated: true)
        }
    }
    
    var onDateSelected: ((_ year: Int) -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.commonSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.commonSetup()
    }
    
    func commonSetup() {
        // population years
        var years: [Int] = []
        if years.count == 0 {
            var year = 1975
//                NSCalendar(identifier: NSCalendar.Identifier.gregorian)!.component(.year, from: NSDate() as Date)
            for _ in 1...125 {
                years.append(year)
                year += 1
            }
        }
        self.years = years
                
        self.delegate = self
        self.dataSource = self
        
        let currentYear = NSCalendar(identifier: NSCalendar.Identifier.gregorian)!.component(.year, from: Date())
        self.selectRow(currentYear - 1975, inComponent: 0, animated: false)
        
    }
    
    // Mark: UIPicker Delegate / Data Source
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return "\(years[row])"
        default:
            return nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return years.count
        default:
            return 0
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let year = years[self.selectedRow(inComponent: 0)]
        if let block = onDateSelected {
            print("year: ", year)
            block(year)
        }
        self.year = year
    }
    
}

