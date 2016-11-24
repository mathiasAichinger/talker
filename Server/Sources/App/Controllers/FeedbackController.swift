//
//  FeedbackController.swift
//  talker-server
//
//  Created by Mathias Aichinger on 23/11/2016.
//
//

import Vapor
import HTTP
import TalkerFramework

final class FeedbackController: ResourceRepresentable {
    func index(request: Request) throws -> ResponseRepresentable {
        return try Feedback.all().makeNode().converted(to: JSON.self)
    }
    
    func create(request: Request) throws -> ResponseRepresentable {
        var feedback = try request.feedback()
        try feedback.save()
        
        if let talkId = feedback.talkId {
            TalkRatingHelper.recalculateAverageRating(for: talkId)
        }
        
        return feedback
    }
    
    func show(request: Request, feedback: Feedback) throws -> ResponseRepresentable {
        return feedback
    }
    
    func delete(request: Request, feedback: Feedback) throws -> ResponseRepresentable {
        let talkId = feedback.talkId
        try feedback.delete()
        if let talkId = talkId {
            TalkRatingHelper.recalculateAverageRating(for: talkId)
        }
        
        return JSON([:])
    }
    
    func makeResource() -> Resource<Feedback> {
        return Resource(
            index: index,
            store: create,
            show: show,
            destroy: delete
        )
    }
}

extension Request {
    func feedback() throws -> Feedback {
        guard let json = json else { throw Abort.badRequest }
        return try Feedback(node: json)
    }
}
