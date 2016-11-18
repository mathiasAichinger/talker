//
//  Talk.swift
//  talker
//
//  Created by Mathias Aichinger on 18/11/2016.
//  Copyright © 2016 Easysolutions. All rights reserved.
//
import Foundation
import SwiftyJSON

class Talk: NSObject, JSONInitializable {

    let id: String
    let title: String
    let speakerImageURL: String
    let speaker: String
    let rating: Int
    let githubUrl: String
    let dateTimestamp: Double
    
    
    init(id: String, title: String, speaker: String, speakerImageURL: String, rating: Int, githubUrl: String, dateTimestamp: Double) {
        self.id = id
        self.title = title
        self.speaker = speaker
        self.speakerImageURL = speakerImageURL
        self.rating = rating
        self.githubUrl = githubUrl
        self.dateTimestamp = dateTimestamp
    }
    
    required init(json: JSON) {
        id = json["id"].stringValue
        title = json["title"].stringValue
        speakerImageURL = json["speakerImageURL"].stringValue
        speaker = json["speaker"].stringValue
        rating = json["speaker"].intValue
        githubUrl = json["githubUrl"].stringValue
        dateTimestamp = json["dateTimestamp"].doubleValue
    }
}
