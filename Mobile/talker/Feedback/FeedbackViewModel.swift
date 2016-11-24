//
//  FeedbackViewModel.swift
//  talker
//
//  Created by Mathias Aichinger on 24/11/2016.
//  Copyright © 2016 Easysolutions. All rights reserved.
//

import Foundation
import TalkerFramework

struct FeedbackViewModel {
    
    var rating: Int = 0
    var feedbackText: String = ""
    
    let talkId: String

    init(talkId: String) {
        self.talkId = talkId
    }
}
