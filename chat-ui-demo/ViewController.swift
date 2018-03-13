//
//  ViewController.swift
//  chat-ui-demo
//
//  Created by Andy Tsai on 13/03/2018.
//  Copyright © 2018 Andy Tsai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let messages = ["jaowiefjaoiw jfeawoie jawioj", "aiowef", "aoiwejaowiefjoaiwje foaiwej fioawefj awioefjawioe", "qowiejqwioej\nqowiejqiowejq\nqowejqwioe"]

    @IBOutlet weak var messageTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageTableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "qweq")
        
        messageTableView.dataSource = self
        messageTableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "qweq") as! TableViewCell
        
        cell.messageLabel.text = messages[indexPath.row]
        
        return cell
    }
}
