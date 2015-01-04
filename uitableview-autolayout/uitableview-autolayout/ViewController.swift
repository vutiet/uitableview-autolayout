//
//  ViewController.swift
//  uitableview-autolayout
//
//  Created by Vu Tiet on 12/22/14.
//  Copyright (c) 2014 vuta. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var dynamicHeightTableView: UITableView?
    @IBOutlet weak var tableHeightConstraint: NSLayoutConstraint!
    let numberOfRow: Int = 3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.dynamicHeightTableView?.registerClass(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        
        // Hide separators
        self.dynamicHeightTableView?.tableFooterView = UIView(frame: CGRectZero)
        
        self.tableHeightConstraint.constant = CGFloat(numberOfRow) * 44
        // Need to call this line to force constraint updated
        self.view.layoutIfNeeded()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRow
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath) as UITableViewCell
        cell.textLabel.text = "item" + String(indexPath.row)
        return cell
    }
}

