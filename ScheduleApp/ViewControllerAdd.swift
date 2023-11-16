//
//  ViewControllerAdd.swift
//  ScheduleApp
//
//  Created by BRENDEN WYDRA on 11/13/23.
//

import UIKit

class ViewControllerAdd: UIViewController {

    @IBOutlet weak var colorButton: UIButton!
    
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
            case "Gree":
                self.onGreen()
            case "Purple":
                self.onPurple()
            default:
                self.view.backgroundColor = UIColor.white
            }
        }
            
        colorButton.menu = UIMenu(children: [
            UIAction(title: "White", state: .on, handler: optionClosure),
            UIAction(title: "Red", state: .on, handler: optionClosure),
            UIAction(title: "Blue", handler: optionClosure),
            UIAction(title: "Green", handler: optionClosure),
            UIAction(title: "Purple", handler: optionClosure),
        ])
    }
    
    func onRed() {
        view.backgroundColor = UIColor(red: 0.902, green: 0.388, blue: 0.388, alpha: 1)
    }
    
    func onBlue() {
        view.backgroundColor = UIColor(red: 0.478, green: 0.573, blue: 1, alpha: 1)
    }
    
    func onGreen() {
        
    }
    
    func onPurple() {
        
    }

}
