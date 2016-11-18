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

let router = Router.register("https://talkerserver.com/api/")

func startMockingNetwork() {
    mockNetwork()
}

private func mockNetwork() {
    router.get("talks/") { (request) -> Serializable? in
        let talk = Talk(id:"1", title: "Server-Side Swift", speaker: "Mathias Aichinger", speakerImageURL: Bundle.main.path(forResource: "profile_small", ofType: "png")!, rating: 5, githubUrl: "http://github.com", dateTimestamp: Date().timeIntervalSince1970)
        let talk2 = Talk(id:"2", title: "Swift 3.0 naming", speaker: "Wolfgang Damm", speakerImageURL: Bundle.main.path(forResource: "wolfgang_damm", ofType: "png")!, rating: 5, githubUrl: "http://github.com", dateTimestamp: Date().timeIntervalSince1970)
        return [talk, talk2]
    }
}
