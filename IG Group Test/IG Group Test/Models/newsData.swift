//
//  newsData.swift
//  IG Group Test
//
//  Created by Khirish Meshram on 2021/12/22.
//
import Foundation
import Foundation

// MARK: News
class News: Codable {
    let breakingNews: String?
    let topNews: [NewsData]
    let dailyBriefings: DailyBriefings
    let technicalAnalysis, specialReport: [NewsData]

    init(breakingNews: String?, topNews: [NewsData], dailyBriefings: DailyBriefings, technicalAnalysis: [NewsData], specialReport: [NewsData]) {
        self.breakingNews = breakingNews
        self.topNews = topNews
        self.dailyBriefings = dailyBriefings
        self.technicalAnalysis = technicalAnalysis
        self.specialReport = specialReport
    }
}

// MARK: - DailyBriefings
class DailyBriefings: Codable {
    let eu, asia, us: [NewsData]

    init(eu: [NewsData], asia: [NewsData], us: [NewsData]) {
        self.eu = eu
        self.asia = asia
        self.us = us
    }
}

// MARK: - NewsData
class NewsData: Codable {
    let title: String
    let url: String
    let specialReportDescription: String?
    let content, firstImageURL: String?
    let headlineImageURL: String?
    let articleImageURL, backgroundImageURL: String?
    let videoType, videoID: String?
    let videoURL: String?
    let videoThumbnail: String?
    let newsKeywords: String?
    let authors: [[String: String?]]
    let instruments: [String]?
    let tags: [String]?
    let categories: [String]
    let displayTimestamp, lastUpdatedTimestamp: Double

    enum CodingKeys: String, CodingKey {
        case title, url
        case specialReportDescription = "description"
        case content
        case firstImageURL = "firstImageUrl"
        case headlineImageURL = "headlineImageUrl"
        case articleImageURL = "articleImageUrl"
        case backgroundImageURL = "backgroundImageUrl"
        case videoType
        case videoID = "videoId"
        case videoURL = "videoUrl"
        case videoThumbnail, newsKeywords, authors, instruments, tags, categories, displayTimestamp, lastUpdatedTimestamp
    }

    init(title: String, url: String, specialReportDescription: String?, content: String?, firstImageURL: String?, headlineImageURL: String?, articleImageURL: String?, backgroundImageURL: String?, videoType: String?, videoID: String?, videoURL: String?, videoThumbnail: String?, newsKeywords: String?, authors: [[String: String?]], instruments: [String]?, tags: [String]?, categories: [String], displayTimestamp: Double, lastUpdatedTimestamp: Double) {
        self.title = title
        self.url = url
        self.specialReportDescription = specialReportDescription
        self.content = content
        self.firstImageURL = firstImageURL
        self.headlineImageURL = headlineImageURL
        self.articleImageURL = articleImageURL
        self.backgroundImageURL = backgroundImageURL
        self.videoType = videoType
        self.videoID = videoID
        self.videoURL = videoURL
        self.videoThumbnail = videoThumbnail
        self.newsKeywords = newsKeywords
        self.authors = authors
        self.instruments = instruments
        self.tags = tags
        self.categories = categories
        self.displayTimestamp = displayTimestamp
        self.lastUpdatedTimestamp = lastUpdatedTimestamp
    }
}


