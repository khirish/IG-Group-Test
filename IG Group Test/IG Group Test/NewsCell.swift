//
//  NewsCell.swift
//  IG Group Test
//
//  Created by Khirish Meshram on 2021/12/22.
//

import UIKit

class NewsCell: UITableViewCell {
    
    @IBOutlet weak var newsTitleLbl: UILabel!
    @IBOutlet weak var newsDescLbl: UILabel!
    @IBOutlet weak var newsDateLbl: UILabel!
    @IBOutlet weak var newsImg: UIImageView!
    
    var newsData: NewsData?
    let dateFormatter = DateFormatter()

    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func setupNewsCell(newsData: NewsData) {
        newsTitleLbl.text = newsData.title
        newsDescLbl.text = newsData.specialReportDescription
        
//        let dispTime = newsData.displayTimestamp
//        let date = Date(timeIntervalSince1970: dispTime)
//        dateFormatter.timeStyle = DateFormatter.Style.medium
//        dateFormatter.dateStyle = DateFormatter.Style.medium
//        dateFormatter.timeZone = .current
//        let newsDate = dateFormatter.string(from: date)
        newsDateLbl.text = BaseViewController().formatDate(timeStamp: newsData.displayTimestamp)
        
        guard let imageUrl = newsData.headlineImageURL, let url = URL(string: imageUrl) else { return }

        if let data = try? Data(contentsOf: url) {
            newsImg.image = UIImage(data: data)
        }
    }
    
}
