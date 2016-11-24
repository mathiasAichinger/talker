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
            guard var talk = try Talk.find(talkId) else {
                return
            }
            
            let feedbacks: [Feedback] = try Feedback.query().filter("talkId", talkId).all()
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
