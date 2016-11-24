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
        return try ServerSpeaker.all().makeNode().converted(to: JSON.self)
    }
    
    func create(request: Request) throws -> ResponseRepresentable {
        var speaker = try request.speaker()
        try speaker.save()
        return speaker
    }
    
    func show(request: Request, speaker: ServerSpeaker) throws -> ResponseRepresentable {
        return speaker
    }
    
    func delete(request: Request, speaker: ServerSpeaker) throws -> ResponseRepresentable {
        try speaker.delete()
        return JSON([:])
    }
    
    func update(request: Request, speaker: ServerSpeaker) throws -> ResponseRepresentable {
        let new = try request.speaker()
        var speaker = speaker
        speaker.speakerName = new.speakerName
        speaker.speakerImageURL = new.speakerImageURL
        
        try speaker.save()
        return speaker
    }
    
    func makeResource() -> Resource<ServerSpeaker> {
        return Resource(
            index: index,
            store: create,
            show: show,
            modify: update,
            destroy: delete
        )
    }
}

extension Request {
    func speaker() throws -> ServerSpeaker {
        guard let json = json else { throw Abort.badRequest }
        return try ServerSpeaker(node: json)
    }
}
