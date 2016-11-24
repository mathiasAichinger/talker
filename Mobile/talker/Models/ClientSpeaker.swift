//
//  Speaker+JSON.swift
//  talker
//
//  Created by Mathias Aichinger on 23/11/2016.
//  Copyright © 2016 Easysolutions. All rights reserved.
//

import Foundation
import SwiftyJSON
import TalkerFramework
import Kakapo

class ClientSpeaker: Speaker, JSONInitializable, Serializable {
    
    public required init(json: JSON) {
        let serverId: String? = json["serverId"].stringValue
        let speakerName: String = json["speakerName"].stringValue
        let speakerImageURL: String? = json["speakerImageURL"].stringValue
        super.init(serverId: serverId, speakerName: speakerName, speakerImageURL: speakerImageURL)
    }
    
    public override init(serverId: String?, speakerName: String, speakerImageURL: String? = nil) {
        super.init(serverId: serverId, speakerName: speakerName, speakerImageURL: speakerImageURL)

    }
}
