//
//  NewsListViewController.swift
//  IG Group Test
//
//  Created by Khirish Meshram on 2021/12/22.
//

import UIKit

class NewsListViewController: BaseViewController {
    
    @IBOutlet weak var _tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _tableView.sectionHeaderTopPadding = 0
        _tableView.register(UINib(nibName: "TopNewsCell", bundle: nil), forCellReuseIdentifier: "TopNewsCell")
        _tableView.register(UINib(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
    }
    
    
    
    
}

extension NewsListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return topNews.count
        case 1: return technicalAnalysis.count
        case 2: return dailyBriefings.count
        case 3: return specialReport.count
        default: return Int()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            guard let topNewsCell = tableView.dequeueReusableCell(withIdentifier: "TopNewsCell", for: indexPath) as? TopNewsCell else { return UITableViewCell() }
            topNewsCell.setupTopNewsCell(newsData: topNews[indexPath.row])
            return topNewsCell
        case 1:
            guard let newsCell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsCell else { return UITableViewCell() }
            newsCell.setupNewsCell(newsData: technicalAnalysis[indexPath.count])
            return newsCell
        case 2:
            guard let newsCell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsCell else { return UITableViewCell() }
            newsCell.setupNewsCell(newsData: dailyBriefings[indexPath.row])
            return newsCell
        case 3:
            guard let newsCell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsCell else { return UITableViewCell() }
            newsCell.setupNewsCell(newsData: specialReport[indexPath.row])
            return newsCell
        default: return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 200
        } else {
            return 120
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 40))
        headerView.backgroundColor = .systemMint
        let headerLbl = UILabel(frame: CGRect(x: 20, y: 0, width: headerView.frame.width, height: headerView.frame.height))
        switch section {
        case 0: headerLbl.text = "Top News"
        case 1: headerLbl.text = "Technical Analysis"
        case 2: headerLbl.text = "Daily News"
        case 3: headerLbl.text = "Special Report"
        default: break
        }
        headerView.addSubview(headerLbl)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sc = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = sc.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        switch indexPath.section {
        case 0: detailVC.newsData = topNews[indexPath.row]
        case 1: detailVC.newsData = technicalAnalysis[indexPath.row]
        case 2: detailVC.newsData = dailyBriefings[indexPath.row]
        case 3: detailVC.newsData = specialReport[indexPath.row]
        default: break
        }
        show(detailVC, sender: self)
    }
    
    
}
