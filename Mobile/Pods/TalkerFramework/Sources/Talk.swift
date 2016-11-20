//
//  Talk.swift
//  talker-server
//
//  Created by Mathias Aichinger on 20/11/2016.
//
//

import Foundation

open class Talk: NSObject {
    public var globalId: String?
    public var title: String
    public var speakerImageURL: String?
    public var speaker: String
    public var rating: Int
    public var githubUrl: String?
    public var dateTimestamp: Double

    public init(globalId: String?, title: String, speaker: String, speakerImageURL: String?, rating: Int, githubUrl: String?, dateTimestamp: Double) {
        self.globalId = globalId
        self.title = title
        self.speaker = speaker
        self.speakerImageURL = speakerImageURL
        self.rating = rating
        self.githubUrl = githubUrl
        self.dateTimestamp = dateTimestamp
    }
}
