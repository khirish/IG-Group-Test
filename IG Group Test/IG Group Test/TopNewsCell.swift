//
//  TopNewsCell.swift
//  IG Group Test
//
//  Created by Khirish Meshram on 2021/12/22.
//

import UIKit

class TopNewsCell: UITableViewCell {

    @IBOutlet weak var newsImg: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    func setupTopNewsCell(newsData: NewsData) {
        if newsData.specialReportDescription == "" {
//            newsImg.image = newsData.videoThumbnail
        } else {
//            newsImg.image = newsData.headlineImageURL
        }
        newsTitle.text = newsData.title
        
        guard let imageUrl = newsData.headlineImageURL, let url = URL(string: imageUrl) else { return }

        if let data = try? Data(contentsOf: url) {
            newsImg.image = UIImage(data: data)
        }
    }
}
