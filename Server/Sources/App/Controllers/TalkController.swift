//
//  STalkController.swift
//  talker-server
//
//  Created by Mathias Aichinger on 20/11/2016.
//
//

import Vapor
import HTTP
import TalkerFramework

final class TalkController: ResourceRepresentable {
    func index(request: Request) throws -> ResponseRepresentable {
        return try Talk.all().makeNode().converted(to: JSON.self)
    }
    
    func create(request: Request) throws -> ResponseRepresentable {
        var talk = try request.talk()
        
        
        try talk.save()
        return talk
    }
    
    func show(request: Request, talk: Talk) throws -> ResponseRepresentable {
        return talk
    }
    
    func delete(request: Request, talk: Talk) throws -> ResponseRepresentable {
        try talk.delete()
        return JSON([:])
    }
    
    func clear(request: Request) throws -> ResponseRepresentable {
        try Talk.query().delete()
        return JSON([])
    }
    
    func update(request: Request, talk: Talk) throws -> ResponseRepresentable {
        let new = try request.talk()
        var talk = talk
        talk.title = new.title
        talk.dateTimestamp = new.dateTimestamp
        talk.speakerId = new.speakerId
        
        if let githubUrl = new.githubUrl {
            talk.githubUrl = githubUrl
        }
        
        try talk.save()
        return talk
    }
    
    func replace(request: Request, talk: Talk) throws -> ResponseRepresentable {
        try talk.delete()
        return try create(request: request)
    }
    
    func makeResource() -> Resource<Talk> {
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
    func talk() throws -> Talk {
        guard let json = json else { throw Abort.badRequest }
        return try Talk(node: json)
    }
}

