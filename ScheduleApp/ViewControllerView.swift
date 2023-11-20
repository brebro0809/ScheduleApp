//
//  ViewControllerView.swift
//  ScheduleApp
//
//  Created by BRENDEN WYDRA on 11/13/23.
//

import UIKit

class ViewControllerView: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var sortButton: UIButton!
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        table.dataSource = self
        table.delegate = self
    }
    
    @IBAction func sortPress(_ sender: UIButton) {
        if(sortButton.titleLabel!.text == "Sort: Name"){
            sortButton.setTitle("Sort: Date", for: .normal)
        } else {
            sortButton.setTitle("Sort: Name", for: .normal)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppDefaults.events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel?.text = AppDefaults.events[indexPath.row].name
        cell.detailTextLabel?.text = "\(AppDefaults.events[indexPath.row].day)"
        let red = AppDefaults.events[indexPath.row].red
        let green = AppDefaults.events[indexPath.row].green
        let blue = AppDefaults.events[indexPath.row].blue
        cell.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            AppDefaults.events.remove(at: indexPath.row)
            let encoder = JSONEncoder()
            if let data = try? encoder.encode(AppDefaults.events){
                userDefaults.set(data, forKey: "myEvents")
            }
            table.deleteRows(at: [indexPath], with: .fade)
            table.reloadData()
        }
    }

}
