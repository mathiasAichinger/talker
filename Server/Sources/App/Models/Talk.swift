//
//  Talk.swift
//  talker-server
//
//  Created by Mathias Aichinger on 20/11/2016.
//
//

import Foundation

class Talk: NSObject {
    var globalId: String?
    var title: String
    var speakerImageURL: String?
    var speaker: String
    var rating: Int
    var githubUrl: String?
    var dateTimestamp: Double

    init(globalId: String?, title: String, speaker: String, speakerImageURL: String?, rating: Int, githubUrl: String?, dateTimestamp: Double) {
        self.globalId = globalId
        self.title = title
        self.speaker = speaker
        self.speakerImageURL = speakerImageURL
        self.rating = rating
        self.githubUrl = githubUrl
        self.dateTimestamp = dateTimestamp
    }
}
