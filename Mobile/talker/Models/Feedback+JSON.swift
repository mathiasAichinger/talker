//
//  Feedback+JSON.swift
//  talker
//
//  Created by Mathias Aichinger on 24/11/2016.
//  Copyright © 2016 Easysolutions. All rights reserved.
//

import Foundation
import SwiftyJSON
import TalkerFramework
import Kakapo

extension Feedback: JSONInitializable, Serializable {
    
    public init(json: JSON) {
        serverId = json["serverId"].stringValue
        rating = json["rating"].intValue
        feedbackText = json["feedbackText"].stringValue
        talkId = json["talkId"].stringValue
    }
    
    func dictionaryRepresentation() -> [String : Any] {
        return [
            "serverId": serverId ?? "",
            "rating": rating,
            "feedbackText": feedbackText,
            "talkId": "talkId"
        ]
        
    }
}
