//
//  STalkController.swift
//  talker-server
//
//  Created by Mathias Aichinger on 20/11/2016.
//
//

import Vapor
import HTTP

final class TalkController: ResourceRepresentable {
    func index(request: Request) throws -> ResponseRepresentable {
        return try ServerTalk.all().makeNode().converted(to: JSON.self)
    }
    
    func create(request: Request) throws -> ResponseRepresentable {
        var talk = try request.talk()
        try talk.save()
        return talk
    }
    
    func show(request: Request, talk: ServerTalk) throws -> ResponseRepresentable {
        return talk
    }
    
    func delete(request: Request, talk: ServerTalk) throws -> ResponseRepresentable {
        try talk.delete()
        return JSON([:])
    }
    
    func clear(request: Request) throws -> ResponseRepresentable {
        try ServerTalk.query().delete()
        return JSON([])
    }
    
    func update(request: Request, talk: ServerTalk) throws -> ResponseRepresentable {
        let new = try request.talk()
        var talk = talk
        talk.title = new.title
        talk.speaker = new.speaker
        talk.rating = new.rating
        talk.dateTimestamp = new.dateTimestamp
        if let speakerImageURL = new.speakerImageURL {
          talk.speakerImageURL = speakerImageURL
        }
        
        if let githubUrl = new.githubUrl {
            talk.githubUrl = githubUrl
        }
        
        try talk.save()
        return talk
    }
    
    func replace(request: Request, talk: ServerTalk) throws -> ResponseRepresentable {
        try talk.delete()
        return try create(request: request)
    }
    
    func makeResource() -> Resource<ServerTalk> {
        return Resource(
            index: index,
            store: create,
            show: show,
            replace: replace,
            modify: update,
            destroy: delete,
            clear: clear
        )
    }
}

extension Request {
    func talk() throws -> ServerTalk {
        guard let json = json else { throw Abort.badRequest }
        return try ServerTalk(node: json)
    }
}

