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
        let talk = Talk(globalId:"1", title: "Server-Side Swift", speaker: "Mathias Aichinger", speakerImageURL: "https://scontent-bru2-1.xx.fbcdn.net/v/t1.0-9/385645_3986911081616_2073176969_n.jpg?oh=8432a9e0bafa92c069baecdb221e0a3a&oe=58C9FE47", rating: 5, githubUrl: "http://github.com", dateTimestamp: Date().timeIntervalSince1970)
        let talk2 = Talk(globalId:"2", title: "Swift 3.0 naming", speaker: "Wolfgang Damm", speakerImageURL: "https://scontent-bru2-1.xx.fbcdn.net/v/t1.0-9/1934302_10156332630305464_7939098691828784373_n.jpg?oh=dc6a4e63a26bb3d028a6f242ef083fda&oe=58D590FA", rating: 5, githubUrl: "http://github.com", dateTimestamp: Date().timeIntervalSince1970)
        return [talk, talk2]
    }
}
