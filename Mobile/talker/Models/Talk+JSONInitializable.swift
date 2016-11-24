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

extension Talk: JSONInitializable {
    
    public init(json: JSON) {
        serverId = json["serverId"].stringValue
        title = json["title"].stringValue
        descriptionText = json["descriptionText"].stringValue
        githubUrl = json["githubUrl"].stringValue
        dateTimestamp = json["dateTimestamp"].doubleValue
        averageRating = json["averageRating"].doubleValue
        speakerId = json["speakerId"].stringValue
        self.loadedSpeaker = nil
    }
}
