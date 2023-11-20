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

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        AppDefaults.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel?.text = AppDefaults.events[indexPath.row].name
        return cell
    }
    
    let defaults = UserDefaults.standard
    

    @IBOutlet weak var table: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        table.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //pony
        
        table.dataSource = self
        table.delegate = self
        
        let decoder = JSONDecoder()
        if let data = defaults.data(forKey: "myEvents") {
            if let decoded = try? decoder.decode([Event].self, from: data){
                print(AppDefaults.events)
                AppDefaults.events = decoded
                print(AppDefaults.events)
            }
        }
        addButton.backgroundColor = .clear
        addButton.layer.cornerRadius = 5
        addButton.layer.borderWidth = 1
        addButton.layer.borderColor = UIColor.black.cgColor
    }

    @IBAction func viewButtonPress(_ sender: UIButton) {
        performSegue(withIdentifier: "toView", sender: self)
    }
    @IBAction func addButtonPress(_ sender: UIButton) {
        performSegue(withIdentifier: "toAdd", sender: self)
    }
    @IBAction func debugPress(_ sender: UIButton) {
        AppDefaults.events = [Event]()
        
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

