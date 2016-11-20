//
//  Talk.swift
//  talker
//
//  Created by Mathias Aichinger on 18/11/2016.
//  Copyright © 2016 Easysolutions. All rights reserved.
//
import Foundation
import SwiftyJSON

class ClientTalk: Talk, JSONInitializable {
    
    required init(json: JSON) {
        let globalId = json["id"].stringValue
        let title = json["title"].stringValue
        let speakerImageURL = json["speakerImageURL"].stringValue
        let speaker = json["speaker"].stringValue
        let rating = json["speaker"].intValue
        let githubUrl = json["githubUrl"].stringValue
        let dateTimestamp = json["dateTimestamp"].doubleValue
        super.init(globalId: globalId, title: title, speaker: speaker, speakerImageURL: speakerImageURL, rating: rating, githubUrl: githubUrl, dateTimestamp: dateTimestamp)
    }
}
