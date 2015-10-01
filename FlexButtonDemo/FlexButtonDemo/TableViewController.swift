//
//  TableViewController.swift
//  FlexButtonDemo
//
//  Created by HeYilei on 30/09/2015.
//  Copyright © 2015 HeYilei. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var buttons = [UIButton]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 300
        let button1 = FlexButton(type: UIButtonType.Custom)
        let button2 = FlexButton(layoutStyle: .DefaultLayout)
        let button3 = FlexButton(layoutStyle: .DefaultLayout)
        configureButton(button1, button2: button2, button3: button3)
        
        let button4 = FlexButton(layoutStyle: FlexButtonLayoutStyle.HorizonLayoutTitleLeftImageRight)
        let button5 = FlexButton(layoutStyle: FlexButtonLayoutStyle.HorizonLayoutTitleLeftImageRight)
        let button6 = FlexButton(layoutStyle: FlexButtonLayoutStyle.HorizonLayoutTitleLeftImageRight)
        configureButton(button4, button2: button5, button3: button6)
        
        let button7 = FlexButton(layoutStyle: FlexButtonLayoutStyle.VerticalLayoutTitleDownImageUp)
        let button8 = FlexButton(layoutStyle: FlexButtonLayoutStyle.VerticalLayoutTitleDownImageUp)
        let button9 = FlexButton(type: UIButtonType.Custom)
        button9.layoutStyle = .VerticalLayoutTitleDownImageUp
        configureButton(button7, button2: button8, button3: button9)
        
        let button10 = FlexButton(layoutStyle: FlexButtonLayoutStyle.VerticalLayoutTitleUpImageDown)
        let button11 = FlexButton(layoutStyle: FlexButtonLayoutStyle.VerticalLayoutTitleUpImageDown)
        let button12 = FlexButton(layoutStyle: FlexButtonLayoutStyle.VerticalLayoutTitleUpImageDown)
        configureButton(button10, button2: button11, button3: button12)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        for subView in cell.contentView.subviews {
            subView.removeFromSuperview()
        }
        cell.contentView.addSubview(buttons[indexPath.row])
        return cell
    }

   func configureButton(button1:UIButton, button2:UIButton, button3:UIButton) {
        button1.setTitle("Button Title", forState: .Normal)
        button2.setImage(UIImage(named: "contact_us"), forState: .Normal)
        button3.setTitle("Button Title", forState: .Normal)
        button3.setImage(UIImage(named: "contact_us"), forState: .Normal)
        configureButton(button1)
        configureButton(button2)
        configureButton(button3)
    }
    
    func configureButton(button:UIButton) {
        button.frame = CGRectMake(5, 5, 200, 200)
        button.setTitleColor(UIColor.blackColor(), forState: .Normal)
        button.layer.borderColor = UIColor.blackColor().CGColor
        button.layer.borderWidth = 1.0
        buttons.append(button)
    }

}
