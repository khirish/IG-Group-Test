//
//  APIManager.swift
//  IG Group Test
//
//  Created by Khirish Meshram on 2021/12/22.
//

import Foundation

class APIManager {
    
    func getNewsResponse(completionHandler: @escaping (_ newsInfo: News?) -> Void) {
        if let responseUrl = URL(string: Constants.mainApiUrl), let data = try? Data(contentsOf: responseUrl), let decodedResponse = try? JSONDecoder().decode(News.self, from: data) {
            completionHandler(decodedResponse)
        } else {
            completionHandler(nil)
        }
    }
    
}
