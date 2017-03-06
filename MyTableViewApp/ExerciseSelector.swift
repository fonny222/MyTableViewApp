//
//  ExerciseSelector.swift
//  MyTableViewApp
//
//  Created by Christopher Fontana on 3/5/17.
//  Copyright © 2017 Christopher Fontana. All rights reserved.
//

import UIKit

class ExerciseSelector: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    // array that fills cells with data
    private let exercises = ["Bench Press","Incline Bench Press","Dumbbell Bench Press","Barbell Curl","Dumbbell Currl","Dumbbell Walking Lunges","Leg Press","Leg Extensions","Seated Barbell Press","Dumbbell Front Raises","Dumbbell Lateral Raises","Seated French Press","Skull Crusher","Triceps Extension","Wide Grip Pulldown","Bent Over Dumbbell Row","Calf Raises"]
    
    //let simpleTableIdentifier = "SimpleTableIdentifier"
    
    @IBOutlet weak var exSelect: UILabel!
    
    
    
    //this is for the segue code i'm testing
    var valueToPass:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK:-
    //MARK; Table View Data source Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return exercises.count
    }
    
    // this sets up the cells and puts the data in the cells calls the right amount
    // the dequeue handles the unused cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell{
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "SimpleTableIdentifier")
        
        // this checks to see if it the cell is nil and takes care of optional problem
        if(cell == nil){
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "SimpleTableIdentifier")
        }
        
        cell?.textLabel?.text = exercises[indexPath.row]
        
        //print(exercises[indexPath.row])
        
        return cell!
    }
 
    // uses delegate to do something with the cells 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("\(exercises[indexPath.row])")
        
        exSelect.text = exercises[indexPath.row]
        
        valueToPass = exercises[indexPath.row]
        print("\(valueToPass!)")
    }
    
    // this uses the segue to send the information to the other viewcontroller
    // I needed to add a button to accomplishi this
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if(segue.identifier == "exLabel"){
            let viewController = segue.destination as! mainScreen
            
            if(valueToPass == nil){
                let title = "No Selection Made!"
                let alert = UIAlertController (title: title, message: "Please Select an Exercise!", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(action)
                present(alert, animated: true, completion: nil)
            }else{
                
            viewController.labelTitle = valueToPass!
            }
        }
    }
    
}
