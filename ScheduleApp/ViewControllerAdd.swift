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
    
    var red, green, blue: CGFloat!
    var currentDay = Day.monday
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
                self.view.backgroundColor = UIColor.white
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
            AppDefaults.events.append(Event(name: nameInput.text!, red: self.red, green: self.green, blue: self.blue, day: currentDay))
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(AppDefaults.events){
                userDefaults.set(data, forKey: "myEvents")
            }
        }
    }
    
    func onRed() {
        view.backgroundColor = UIColor(red: 0.902, green: 0.388, blue: 0.388, alpha: 1)
        self.red = 0.902
        self.green = 0.388
        self.blue = 0.388
    }
    
    func onBlue() {
        view.backgroundColor = UIColor(red: 0.341, green: 0.576, blue: 0.89, alpha: 1)
        self.red = 0.341
        self.green = 0.576
        self.blue = 0.89
    }
    
    func onGreen() {
        view.backgroundColor = UIColor(red: 0.341, green: 0.89, blue: 0.435, alpha: 1)
        self.red = 0.341
        self.green = 0.89
        self.blue = 0.435
    }
    
    func onPurple() {
        view.backgroundColor = UIColor(red: 0.616, green: 0.341, blue: 0.89, alpha: 1)
        self.red = 0.616
        self.green = 0.341
        self.blue = 0.89
    }

}
