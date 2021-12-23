//
//  ViewController.swift
//  IG Group Test
//
//  Created by Khirish Meshram on 2021/12/22.
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var _tableView: UITableView!
    
    var newsList = [NewsData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
    }
    
    
}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(" ******** \(newsList.count)")
        return newsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let newsCell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsCell {
            
            
        return newsCell
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    
}

