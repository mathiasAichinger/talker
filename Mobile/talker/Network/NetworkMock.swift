//
//  NetworkMock.swift
//  talker
//
//  Created by Mathias Aichinger on 18/11/2016.
//  Copyright © 2016 Easysolutions. All rights reserved.
//

import Foundation
import Kakapo
import SwiftyJSON
import TalkerFramework

let router = Router.register("http://localhost:8080/")

func startMockingNetwork() {
    mockNetwork()
}

private func mockNetwork() {
    router.get("talks/") { (request) -> Serializable? in
        let talk = Talk(serverId: "1", title: "Server-Side Swift", rating: 5, githubUrl: "http://github.com", dateTimestamp:  Date().timeIntervalSince1970, speakerId: "1")
        let talk2 = Talk(serverId:"2", title: "Swift 3.0 naming", rating: 5, githubUrl: "http://github.com", dateTimestamp: Date().timeIntervalSince1970, speakerId: "2")
        return [talk, talk2]
    }
    
    router.get("speakers/") { (request) -> Serializable? in
        let speaker = Speaker(serverId: "1", speakerName: "Mathias Aichinger")
        let speaker2 = Speaker(serverId: "2", speakerName: "Mathias Aichinger")
        
        return [speaker, speaker2]
    }
    
    router.get("speakers/:id") { (request) -> Serializable? in
        if request.components["id"] == "1" {
            let speaker = Speaker(serverId: "1", speakerName: "Mathias Aichinger")
            return speaker
        } else {
           let speaker2 = Speaker(serverId: "2", speakerName: "Wolfgang Damm")
            return speaker2
        }
    }
}
