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

class ClientFeedback: Feedback, JSONInitializable, Serializable {
    
    public required init(json: JSON) {
        let serverId: String? = json["serverId"].stringValue
        let rating: Int = json["rating"].intValue
        let feedbackText: String = json["feedbackText"].stringValue
        let talkId: String? = json["talkId"].stringValue
        super.init(serverId: serverId, rating: rating, feedbackText: feedbackText, talkId: talkId)
    }
    
    public override init(serverId: String?, rating: Int, feedbackText: String, talkId: String? = nil) {
        super.init(serverId: serverId, rating: rating, feedbackText: feedbackText, talkId: talkId)
    }
    
    func dictionaryRepresentation() -> [String : Any] {
        return [
            "serverId": serverId ?? "",
            "rating": rating,
            "feedbackText": feedbackText,
            "talkId": talkId!
        ]
        
    }
}
