//
//  Talk.swift
//  talker
//
//  Created by Mathias Aichinger on 18/11/2016.
//  Copyright © 2016 Easysolutions. All rights reserved.
//
import Foundation

struct Talk {

    let title: String
    let speakerImageURL: URL
    let speaker: String
    let rating: Int8
    let githubUrl: URL
    let date: Date
    
    
    init(title: String, speaker: String, speakerImageURL: URL, rating: Int8, githubUrl: URL, date: Date) {
        self.title = title
        self.speaker = speaker
        self.speakerImageURL = speakerImageURL
        self.rating = rating
        self.githubUrl = githubUrl
        self.date = date
    }
}
