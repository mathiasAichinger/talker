//
//  TalkDetaiViewModel.swift
//  talker
//
//  Created by Mathias Aichinger on 20/11/2016.
//  Copyright © 2016 Easysolutions. All rights reserved.
//

import UIKit
import TalkerFramework

struct TalkDetaiViewModel {

    let talk: Talk
    
    init(talk: Talk) {
        self.talk = talk
    }
    
    var descriptionText: String {
            return talk.descriptionText

    }
    
    var githubUrl: URL? {
        if let githubUrl = talk.githubUrl {
            return URL(string: githubUrl)
        } else {
            return nil
        }
    }
    
    var numberOfRows: Int {
        if let _ = githubUrl {
            return 4
        } else {
            return 3
        }
    }
}
