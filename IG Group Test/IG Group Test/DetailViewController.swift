//
//  DetailViewController.swift
//  IG Group Test
//
//  Created by Khirish Meshram on 2021/12/23.
//

import UIKit
import AVKit

class DetailViewController: BaseViewController {
    
    @IBOutlet weak var newsImg: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var authorImg: UIImageView!
    @IBOutlet weak var authorNameLbl: UILabel!
    @IBOutlet weak var authorDescLbl: UILabel!
    @IBOutlet weak var newsDispDate: UILabel!
    @IBOutlet weak var newsUpdatedDate: UILabel!
    @IBOutlet weak var newsDescLbl: UILabel!
    
    let dateFormatter = DateFormatter()
    var newsData: NewsData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let newsdata = newsData else { return }
        configureDetailView(newsData: newsdata)
    }

    func configureDetailView(newsData: NewsData) {
        newsDispDate.text = formatDate(timeStamp: newsData.displayTimestamp)
        newsUpdatedDate.text = formatDate(timeStamp: newsData.lastUpdatedTimestamp)

        guard let imageUrl = newsData.headlineImageURL,
              let url = URL(string: imageUrl)
        else { return }
        if let data = try? Data(contentsOf: url) {
            newsImg.image = UIImage(data: data)
        }

        newsTitle.text = newsData.title
        newsDescLbl.text = newsData.specialReportDescription
        
        for data in newsData.authors {
            if let authorImgUrl = data["photo"] as? String, let authorName = data["name"] as? String, let authorDesc = data["descriptionShort"] as? String {
                guard let url = URL(string: authorImgUrl), let data = try? Data(contentsOf: url) else { return }
                authorImg.image = UIImage(data: data)
                authorNameLbl.text = authorName
                authorDescLbl.text = authorDesc
            }
        }
    }
    
    @IBAction func watchVideoBtnTapped(_ sender: UIButton) {
        if let newsdata = newsData, let videoUrl = newsdata.videoURL {
            let videoURL = URL(string: videoUrl)
            let player = AVPlayer(url: videoURL!)
            let playerViewController = AVPlayerViewController()
            playerViewController.player = player
            self.present(playerViewController, animated: true) {
                playerViewController.player!.play()
            }
        }
    }
    
    @IBAction func checkBtnTapped(_ sender: UIButton) {
        let sc = UIStoryboard(name: "Main", bundle: nil)
        guard let webVC = sc.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController else { return }
        webVC.webUrl = newsData?.url
        show(webVC, sender: self)
    }
    
}
