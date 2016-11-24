//
//  TalkRatingHelper.swift
//  talker-server
//
//  Created by Mathias Aichinger on 23/11/2016.
//
//

import Foundation
import TalkerFramework
import Fluent

class TalkRatingHelper {
    
    class func recalculateAverageRating(for talkId: String) {
        do {
            let feedbacks: [ServerFeedback] = try ServerFeedback.query().filter("talkId", talkId).all()
            guard var talk = try ServerTalk.find(talkId) else {
                return
            }
            
            if feedbacks.count > 0 {
                let sumRating: Int = feedbacks.reduce(0, { $0 + $1.rating })
                talk.averageRating = Double(sumRating)/Double(feedbacks.count)
                try talk.save()
            }
        } catch _ {
            NSLog("Error calculating average rating")
        }
        
    }
}
