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
            if(action.title == "Red"){
                self.onRed()
            }
        }
            
        colorButton.menu = UIMenu(children: [
            UIAction(title: "Red", state: .on, handler: optionClosure),
            UIAction(title: "Blue", handler: optionClosure),
            UIAction(title: "Green", handler: optionClosure),
            UIAction(title: "Purple", handler: optionClosure),
        ])
    }
    
    func onRed() {
        view.backgroundColor = UIColor(red: 0.329, green: 0.82, blue: 0.502, alpha: 1)
    }
    

}
