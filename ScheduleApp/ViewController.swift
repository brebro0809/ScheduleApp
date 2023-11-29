//
//  ViewController.swift
//  ScheduleApp
//
//  Created by BRENDEN WYDRA on 11/13/23.
//

import UIKit

class AppDefaults {
    static var events = [Event]()
    static var currentDay = Day.monday
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var currentDayList: [Int : Int] = [:]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        for event in AppDefaults.events{
            if(event.day == AppDefaults.currentDay) {
                count += 1
            }
        }
        return count
    }
    
    var pointer = 0
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        pointer += 1
        
        if (indexPath.row == 0){
            pointer = 0
            currentDayList = [:]
        }
        
        for i in pointer ..< AppDefaults.events.count {
            if AppDefaults.events[i].day == AppDefaults.currentDay {
                pointer = i
                break
            }
        }
        currentDayList[indexPath.row] = pointer
        let cell = table.dequeueReusableCell(withIdentifier: "myCell")! as! DayCell
        cell.dayLabel.text = AppDefaults.events[pointer].name
        cell.checkLabel.isHidden = !AppDefaults.events[pointer].isChecked
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(AppDefaults.events[indexPath.row].isChecked)
        let index = currentDayList[indexPath.row]
        AppDefaults.events[index!].isChecked = !AppDefaults.events[index!].isChecked
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(AppDefaults.events){
            defaults.set(data, forKey: "myEvents")
        }
        table.reloadData()
        tableView.deselectRow(at: indexPath, animated: false)
        print(AppDefaults.events[indexPath.row].isChecked)
    }
    
    let defaults = UserDefaults.standard
    

    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var dayLabel: UILabel!
    
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
    
        if let data = defaults.data(forKey: "myDay") {
            if let decoded = try? decoder.decode(Day.self, from: data){
                AppDefaults.currentDay = decoded
            }
        }
        table.reloadData()
        switch AppDefaults.currentDay{
        case .monday:
            dayLabel.text = "Monday"
        case .tuesday:
            dayLabel.text = "Tuesday"
        case .wednesday:
            dayLabel.text = "Wednesday"
        case .thursday:
            dayLabel.text = "Thursday"
        case .friday:
            dayLabel.text = "Friday"
        case .saturday:
            dayLabel.text = "Saturday"
        case .sunday:
            dayLabel.text = "Sunday"
        }
    }
    
    @IBAction func nextPress(_ sender: UIButton) {
        switch AppDefaults.currentDay{
        case .monday:
            AppDefaults.currentDay = .tuesday
            dayLabel.text = "Tuesday"
        case .tuesday:
            AppDefaults.currentDay = .wednesday
            dayLabel.text = "Wednesday"
        case .wednesday:
            AppDefaults.currentDay = .thursday
            dayLabel.text = "Thursday"
        case .thursday:
            AppDefaults.currentDay = .friday
            dayLabel.text = "Friday"
        case .friday:
            AppDefaults.currentDay = .saturday
            dayLabel.text = "Saturday"
        case .saturday:
            AppDefaults.currentDay = .sunday
            dayLabel.text = "Sunday"
        case .sunday:
            AppDefaults.currentDay = .monday
            dayLabel.text = "Monday"
        }
        table.reloadData()
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(AppDefaults.currentDay){
            defaults.set(data, forKey: "myDay")
        }
    }
    
    @IBAction func lastAction(_ sender: Any) {
        switch AppDefaults.currentDay{
        case .monday:
            AppDefaults.currentDay = .sunday
            dayLabel.text = "Sunday"
        case .tuesday:
            AppDefaults.currentDay = .monday
            dayLabel.text = "Monday"
        case .wednesday:
            AppDefaults.currentDay = .tuesday
            dayLabel.text = "Tuesday"
        case .thursday:
            AppDefaults.currentDay = .wednesday
            dayLabel.text = "Wednesday"
        case .friday:
            AppDefaults.currentDay = .thursday
            dayLabel.text = "Thursday"
        case .saturday:
            AppDefaults.currentDay = .friday
            dayLabel.text = "Friday"
        case .sunday:
            AppDefaults.currentDay = .sunday
            dayLabel.text = "Saturday"
        }
        table.reloadData()
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(AppDefaults.currentDay){
            defaults.set(data, forKey: "myDay")
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
        
        let encoder = JSONEncoder()
        if let data = try? encoder.encode(AppDefaults.events){
            defaults.set(data, forKey: "myEvents")
            print("added")
        }
        table.reloadData()
    }
    
    @IBAction func clearButtonPress(_ sender: UIButton) {
        AppDefaults.events = AppDefaults.events.filter { !$0.isChecked }
        table.reloadData()
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
    var isChecked: Bool
}

