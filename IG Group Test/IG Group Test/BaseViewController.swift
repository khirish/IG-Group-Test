//
//  BaseViewController.swift
//  IG Group Test
//
//  Created by Khirish Meshram on 2021/12/22.
//

import UIKit

class BaseViewController: UIViewController {
    
    var topNews = [NewsData]()
    var technicalAnalysis = [NewsData]()
    var dailyBriefings = [NewsData]()
    var specialReport = [NewsData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNewsData()
    }
    
    func setupNewsData() {
        APIManager().getNewsResponse { newsInfo in
            guard let newsdata = newsInfo else { return }
            self.topNews = newsdata.topNews
            self.technicalAnalysis = newsdata.technicalAnalysis
            self.dailyBriefings.append(contentsOf: newsdata.dailyBriefings.eu)
            self.dailyBriefings.append(contentsOf: newsdata.dailyBriefings.asia)
            self.dailyBriefings.append(contentsOf: newsdata.dailyBriefings.us)
            self.specialReport = newsdata.specialReport
        }
    }
    
    func formatDate(timeStamp: Double) -> String {
        let updateTime = timeStamp / 1000
        let updatedate = Date(timeIntervalSince1970: updateTime)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeZone = .current
        dateFormatter.dateFormat = "yyyy-MMM-dd HH:mm a"
        let updatedDate = dateFormatter.string(from: updatedate)
        return updatedDate
    }
    

}
