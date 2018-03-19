//
//  ViewController.swift
//  chat-ui-demo
//
//  Created by Andy Tsai on 13/03/2018.
//  Copyright © 2018 Andy Tsai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let messages = [
        Message(from: 1, to: 2, text: "hi"),
        Message(from: 2, to: 1, text: "hi Hi HI"),
        Message(from: 1, to: 2, text: "hi"),
        Message(from: 1, to: 2, text: "hi"),
        Message(from: 1, to: 2, text: "hi"),
        Message(from: 1, to: 2, text: "hi"),
        Message(from: 1, to: 2, text: "hi"),
        Message(from: 1, to: 2, text: "hi"),
        Message(from: 1, to: 2, text: "hi"),
        Message(from: 2, to: 1, text: "hi Hi HI"),
        Message(from: 2, to: 1, text: "hi Hi HI"),
        Message(from: 2, to: 1, text: "hi Hi HI\nqwoiejqiowej"),
        Message(from: 2, to: 1, text: "hi Hi HI"),
        Message(from: 2, to: 1, text: "hi Hi HI"),
        Message(from: 1, to: 2, text: "hi"),
        Message(from: 1, to: 2, text: "hi"),
        Message(from: 1, to: 2, text: "hi"),
        Message(from: 1, to: 2, text: "hi"),
        Message(from: 2, to: 1, text: "hi Hi HI")
    ]

    @IBOutlet weak var messageTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        messageTableView.register(UINib(nibName: "LeftTableViewCell", bundle: nil), forCellReuseIdentifier: "LeftTableViewCell")
        messageTableView.register(UINib(nibName: "RightTableViewCell", bundle: nil), forCellReuseIdentifier: "RightTableViewCell")
        
        messageTableView.dataSource = self
        messageTableView.delegate = self
        messageTableView.reloadData()

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    }
}

extension ViewController {
    @objc func keyboardWillShow(notification: Notification) {
        dump(notification.userInfo)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ceil(messages[indexPath.row].text.boundingRect(with: CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, attributes: [NSAttributedStringKey.font: UIFont.preferredFont(forTextStyle: .body)], context: nil).size.height) + 8 * 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        let cell = message.from == 1 ? tableView.dequeueReusableCell(withIdentifier: "LeftTableViewCell") as! LeftTableViewCell : tableView.dequeueReusableCell(withIdentifier: "RightTableViewCell") as! RightTableViewCell
        
        if let cell = cell as? RightTableViewCell {
            cell.messageLabel.text = message.text
        }

        if let cell = cell as? LeftTableViewCell {
            cell.messageLabel?.text = message.text
        }

        return cell
    }
}
