//
//  ViewControllerAdd.swift
//  ScheduleApp
//
//  Created by BRENDEN WYDRA on 11/13/23.
//

import UIKit

class ViewControllerAdd: UIViewController {
    
    let userDefaults = UserDefaults.standard

    @IBOutlet weak var colorButton: UIButton!
    @IBOutlet weak var dayButton: UIButton!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    var red = 1.0
    var green = 1.0
    var blue = 1.0
    var currentDay = Day.monday
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        self.dayButton.backgroundColor = UIColor.white
        self.colorButton.backgroundColor = UIColor.white
        self.addButton.backgroundColor = UIColor.white
        self.dayButton.setTitleColor(UIColor.black, for: .normal)
        self.colorButton.setTitleColor(UIColor.black, for: .normal)
        self.addButton.setTitleColor(UIColor.black, for: .normal)
        self.red = 1
        self.green = 1
        self.blue = 1

        colorButton.showsMenuAsPrimaryAction = true
        colorButton.changesSelectionAsPrimaryAction = true
            
        let optionClosure = {(action: UIAction) in
            switch action.title {
            case "Red":
                self.onRed()
            case "Blue":
                self.onBlue()
            case "Green":
                self.onGreen()
            case "Purple":
                self.onPurple()
            default:
                self.dayButton.backgroundColor = UIColor.white
                self.colorButton.backgroundColor = UIColor.white
                self.addButton.backgroundColor = UIColor.white
                self.dayButton.setTitleColor(UIColor.black, for: .normal)
                self.colorButton.setTitleColor(UIColor.black, for: .normal)
                self.addButton.setTitleColor(UIColor.black, for: .normal)
                self.red = 1
                self.green = 1
                self.blue = 1

            }
        }
            
        colorButton.menu = UIMenu(children: [
            UIAction(title: "White", state: .on, handler: optionClosure),
            UIAction(title: "Red", state: .on, handler: optionClosure),
            UIAction(title: "Blue", handler: optionClosure),
            UIAction(title: "Green", handler: optionClosure),
            UIAction(title: "Purple", handler: optionClosure),
        ])
        
        dayButton.showsMenuAsPrimaryAction = true
        dayButton.changesSelectionAsPrimaryAction = true
            
        let optionClosure2 = {(action: UIAction) in
            switch action.title {
            case "Monday":
                self.currentDay = Day.monday
            case "Tuesday":
                self.currentDay = Day.tuesday
            case "Wednesday":
                self.currentDay = Day.wednesday
            case "Thursday":
                self.currentDay = Day.thursday
            case "Friday":
                self.currentDay = Day.friday
            case "Saturday":
                self.currentDay = Day.saturday
            case "Sunday":
                self.currentDay = Day.sunday
            default:
                print("hi")
            }
        }
            
        dayButton.menu = UIMenu(children: [
            UIAction(title: "Monday", state: .on, handler: optionClosure2),
            UIAction(title: "Tuesday", state: .on, handler: optionClosure2),
            UIAction(title: "Wednesday", handler: optionClosure2),
            UIAction(title: "Thursday", handler: optionClosure2),
            UIAction(title: "Friday", handler: optionClosure2),
            UIAction(title: "Saturday", handler: optionClosure2),
            UIAction(title: "Sunday", handler: optionClosure2),
        ])
    }
    
    @IBAction func addPress(_ sender: UIButton) {
        if (nameInput.text != "") {
            AppDefaults.events.append(Event(name: nameInput.text!, red: self.red, green: self.green, blue: self.blue, day: currentDay, isChecked: false))
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(AppDefaults.events){
                userDefaults.set(data, forKey: "myEvents")
            }
            nameInput.text = ""
        }
    }
    
    func onRed() {
        let red = UIColor(red: 1, green: 0.4, blue: 0.4, alpha: 1)
        dayButton.backgroundColor = red
        colorButton.backgroundColor = red
        addButton.backgroundColor = red
        self.dayButton.setTitleColor(UIColor.white, for: .normal)
        self.colorButton.setTitleColor(UIColor.white, for: .normal)
        self.addButton.setTitleColor(UIColor.white, for: .normal)
        self.red = 1
        self.green = 0.522
        self.blue = 0.522
    }
    
    func onBlue() {
        let blue = UIColor(red: 0.459, green: 0.69, blue: 1, alpha: 1)
        dayButton.backgroundColor = blue
        colorButton.backgroundColor = blue
        addButton.backgroundColor = blue
        self.dayButton.setTitleColor(UIColor.white, for: .normal)
        self.colorButton.setTitleColor(UIColor.white, for: .normal)
        self.addButton.setTitleColor(UIColor.white, for: .normal)
        self.red = 0.459
        self.green = 0.69
        self.blue = 1
    }
    
    func onGreen() {
        let green = UIColor(red: 0.475, green: 0.769, blue: 0.486, alpha: 1)
        dayButton.backgroundColor = green
        colorButton.backgroundColor = green
        addButton.backgroundColor = green
        self.dayButton.setTitleColor(UIColor.white, for: .normal)
        self.colorButton.setTitleColor(UIColor.white, for: .normal)
        self.addButton.setTitleColor(UIColor.white, for: .normal)
        self.red = 0.475
        self.green = 0.769
        self.blue = 0.486
    }
    
    func onPurple() {
        let purple = UIColor(red: 0.706, green: 0.51, blue: 0.859, alpha: 1)
        dayButton.backgroundColor = purple
        colorButton.backgroundColor = purple
        addButton.backgroundColor = purple
        self.dayButton.setTitleColor(UIColor.white, for: .normal)
        self.colorButton.setTitleColor(UIColor.white, for: .normal)
        self.addButton.setTitleColor(UIColor.white, for: .normal)
        self.red = 0.706
        self.green = 0.51
        self.blue = 0.859
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

}
