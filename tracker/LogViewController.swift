//
//  LogViewController.swift
//  tracker
//
//  Created by Jonah Pelfrey on 10/20/17.
//  Copyright © 2017 Jonah Pelfrey. All rights reserved.
//

import UIKit

class LogViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? LogViewCell else { return LogViewCell() }
        
        cell.dateLabel.text = getDateAsString()
        return cell
    }
    
    func getDateAsString() -> String
    {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter.string(from: date)
    }
    
    


}
