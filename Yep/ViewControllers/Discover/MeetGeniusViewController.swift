//
//  MeetGeniusViewController.swift
//  Yep
//
//  Created by NIX on 16/5/27.
//  Copyright © 2016年 Catch Inc. All rights reserved.
//

import UIKit

class MeetGeniusViewController: UIViewController {

    var showGeniusInterviewAction: (() -> Void)?

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.tableHeaderView = MeetGeniusShowView(frame: CGRect(x: 0, y: 0, width: 100, height: 180))

            tableView.rowHeight = 90

            tableView.registerNibOf(GeniusInterviewCell)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        println("tableView.tableHeaderView: \(tableView.tableHeaderView)")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension MeetGeniusViewController: UITableViewDataSource, UITableViewDelegate {

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell: GeniusInterviewCell = tableView.dequeueReusableCell()
        cell.avatarImageView.image = UIImage(named: "yep_icon_solo")
        cell.numberLabel.text = String(format: "#%03d", indexPath.row)

        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

        showGeniusInterviewAction?()
    }
}

