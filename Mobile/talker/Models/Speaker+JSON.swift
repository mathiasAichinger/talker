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

extension Speaker: JSONInitializable, Serializable {
    
    public init(json: JSON) {
        serverId = json["serverId"].stringValue
        speakerName = json["speakerName"].stringValue
        speakerImageURL = json["speakerImageURL"].stringValue
    }
}
