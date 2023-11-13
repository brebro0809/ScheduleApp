//
//  ViewController.swift
//  ScheduleApp
//
//  Created by BRENDEN WYDRA on 11/13/23.
//

import UIKit

class ViewController: UIViewController {

    var events = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func viewButtonPress(_ sender: UIButton) {
        performSegue(withIdentifier: "toView", sender: self)
    }
    @IBAction func addButtonPress(_ sender: UIButton) {
        performSegue(withIdentifier: "toAdd", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toView") {
            
        }
        if (segue.identifier == "toAdd"){
            
        }
    }
    
}

enum Day {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
}

struct Event {
    var name: String
    var color: UIColor
    var day: Day
}

