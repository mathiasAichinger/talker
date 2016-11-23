//
//  SpeakerController.swift
//  talker-server
//
//  Created by Mathias Aichinger on 22/11/2016.
//
//

import Vapor
import HTTP
import TalkerFramework

final class SpeakerController: ResourceRepresentable {
    func index(request: Request) throws -> ResponseRepresentable {
        return try Speaker.all().makeNode().converted(to: JSON.self)
    }
    
    func create(request: Request) throws -> ResponseRepresentable {
        var speaker = try request.speaker()
        try speaker.save()
        return speaker
    }
    
    func show(request: Request, speaker: Speaker) throws -> ResponseRepresentable {
        return speaker
    }
    
    func delete(request: Request, speaker: Speaker) throws -> ResponseRepresentable {
        try speaker.delete()
        return JSON([:])
    }
    
    func clear(request: Request) throws -> ResponseRepresentable {
        try Talk.query().delete()
        return JSON([])
    }
    
    func update(request: Request, speaker: Speaker) throws -> ResponseRepresentable {
        let new = try request.speaker()
        var speaker = speaker
        speaker.speakerName = new.speakerName
        speaker.speakerImageURL = new.speakerImageURL
        
        try speaker.save()
        return speaker
    }
    
    func replace(request: Request, speaker: Speaker) throws -> ResponseRepresentable {
        try speaker.delete()
        return try create(request: request)
    }
    
    func makeResource() -> Resource<Speaker> {
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
    func speaker() throws -> Speaker {
        guard let json = json else { throw Abort.badRequest }
        return try Speaker(node: json)
    }
}
