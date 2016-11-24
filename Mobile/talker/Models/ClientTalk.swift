//
//  Talk.swift
//  talker
//
//  Created by Mathias Aichinger on 18/11/2016.
//  Copyright © 2016 Easysolutions. All rights reserved.
//
import Foundation
import SwiftyJSON
import TalkerFramework

class ClientTalk: Talk, JSONInitializable {
    
    public required init(json: JSON) {
        let serverId: String? = json["serverId"].stringValue
        let title: String = json["title"].stringValue
        let descriptionText: String = json["descriptionText"].stringValue
        let githubUrl: String? = json["githubUrl"].stringValue
        let dateTimestamp: Double = json["dateTimestamp"].doubleValue
        let averageRating: Double  = json["averageRating"].doubleValue
        let speakerId: String? = json["speakerId"].stringValue
        super.init(serverId: serverId, title: title, descriptionText: descriptionText, githubUrl: githubUrl, dateTimestamp: dateTimestamp, averageRating: averageRating, speakerId: speakerId)
    }
}
