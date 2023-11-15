//
//  ViewController.swift
//  ScheduleApp
//
//  Created by BRENDEN WYDRA on 11/13/23.
//

import UIKit

class AppDefaults {
    static var events = [Event]()
}

class ViewController: UIViewController {
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //pony
        let decoder = JSONDecoder()
        if let data = defaults.data(forKey: "myEvents") {
            if let decoded = try? decoder.decode([Event].self, from: data){
                print(AppDefaults.events)
                AppDefaults.events = decoded
                print(AppDefaults.events)
            }
        }
    }

    @IBAction func viewButtonPress(_ sender: UIButton) {
        performSegue(withIdentifier: "toView", sender: self)
    }
    @IBAction func addButtonPress(_ sender: UIButton) {
        performSegue(withIdentifier: "toAdd", sender: self)
    }
    @IBAction func debugPress(_ sender: UIButton) {
        AppDefaults.events = [Event]()
        AppDefaults.events.append(Event(name: "school", red: 0.329, green: 0.82, blue: 0.502, day: .friday))
        
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(AppDefaults.events){
            defaults.set(data, forKey: "myEvents")
            print("added")
        }
    }
}

enum Day: Codable {
    case monday, tuesday, wednesday, thursday, friday, saturday, sunday
}

struct Event: Codable {
    var name: String
    var red, green, blue: CGFloat
    var day: Day
}

