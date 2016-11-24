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
        return try ServerFeedback.all().makeNode().converted(to: JSON.self)
    }
    
    func create(request: Request) throws -> ResponseRepresentable {
        var feedback = try request.feedback()
        try feedback.save()
        
        if let talkId = feedback.talkId {
            TalkRatingHelper.recalculateAverageRating(for: talkId)
        }
        
        return feedback
    }
    
    func show(request: Request, feedback: ServerFeedback) throws -> ResponseRepresentable {
        return feedback
    }
    
    func delete(request: Request, feedback: ServerFeedback) throws -> ResponseRepresentable {
        let talkId = feedback.talkId
        try feedback.delete()
        if let talkId = talkId {
            TalkRatingHelper.recalculateAverageRating(for: talkId)
        }
        
        return JSON([:])
    }
    
    func makeResource() -> Resource<ServerFeedback> {
        return Resource(
            index: index,
            store: create,
            show: show,
            destroy: delete
        )
    }
}

extension Request {
    func feedback() throws -> ServerFeedback {
        guard let json = json else { throw Abort.badRequest }
        return try ServerFeedback(node: json)
    }
}
