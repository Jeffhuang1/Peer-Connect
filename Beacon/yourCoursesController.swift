//
//  yourCoursesController.swift
//  Beacon
//
//  Created by Jeffrey Huang on 2015-12-29.
//  Copyright © 2015 Jeffrey Huang. All rights reserved.
//

import UIKit

class YourCoursesController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var courseTable: UITableView!
    
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.courseTable.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        self.courseTable.dataSource = self

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if appDelegate.courses.count == 0 {
            return 1
        }
        else {
            return appDelegate.courses.count
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.courseTable
        .dequeueReusableCellWithIdentifier("cell") as UITableViewCell!
        if appDelegate.courses.count > 0 {
        
            cell.textLabel!.text = appDelegate.courses[indexPath.row]
        }
        else {
            cell.textLabel!.text = "Add some courses!"
        }
        
        return cell
    }
    
    override func viewDidAppear(animated: Bool) {
            self.courseTable.reloadData()
    }
}