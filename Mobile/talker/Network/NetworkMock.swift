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
        let talk = Talk(serverId:"1", title: "Swift 3.0 naming", descriptionText: "Wolfgang Damm (Fretello) will be looking into how we are supposed to name things now and why this is a good thing.", githubUrl: "http://github.com", dateTimestamp: Date().timeIntervalSince1970, averageRating: 5.0, speakerId: "1")
        let talk2 = Talk(serverId: "2", title: "Server-Side Swift", descriptionText: "Mathias Aichinger (Runtastic) will show how to use Swift as a Backend for your Apps.   His talk will cover the status quo of Open Source projects and will end with a short hands-on session.", githubUrl: "http://github.com", dateTimestamp:  Date().timeIntervalSince1970, averageRating: 4.5, speakerId: "2")
        return [talk, talk2]
    }
    
    router.get("speakers/") { (request) -> Serializable? in
        let speaker = Speaker(serverId: "1", speakerName: "Wolfgang Damm")
        let speaker2 = Speaker(serverId: "2", speakerName: "Mathias Aichinger")
        return [speaker, speaker2]
    }
    
    router.get("speakers/:id") { (request) -> Serializable? in
        if request.components["id"] == "1" {
            let speaker = Speaker(serverId: "1", speakerName: "Wolfgang Damm", speakerImageURL: "https://scontent-bru2-1.xx.fbcdn.net/v/t1.0-9/1934302_10156332630305464_7939098691828784373_n.jpg?oh=dc6a4e63a26bb3d028a6f242ef083fda&oe=58D590FA")
            return speaker
        } else {
            let speaker = Speaker(serverId: "2", speakerName: "Mathias Aichinger", speakerImageURL: "https://scontent-bru2-1.xx.fbcdn.net/v/t1.0-9/385645_3986911081616_2073176969_n.jpg?oh=8432a9e0bafa92c069baecdb221e0a3a&oe=58C9FE47")
            return speaker
        }
    }
}
