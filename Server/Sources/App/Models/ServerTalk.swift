//
//  Talk.swift
//  talker
//
//  Created by Mathias Aichinger on 18/11/2016.
//  Copyright © 2016 Easysolutions. All rights reserved.
//
import Foundation
import Vapor
import Fluent
import TalkerFramework

final class ServerTalk: Talk, Model {

    var id: Node? {
        didSet {
            globalId = id?.string
        }
    }
    
    var exists: Bool = false
    
    init(node: Node, in context: Context) throws {
        self.id = try node.extract("id")
        let globalId: String? = try node.extract("id")
        let title: String? = try node.extract("title")
        let speaker: String? = try node.extract("speaker")
        let speakerImageURL: String? = try node.extract("speakerImageURL")
        let rating: String? = try node.extract("rating")
        let githubUrl: String? = try node.extract("githubUrl")
        let dateTimestamp: String? = try node.extract("dateTimestamp")
        super.init(globalId: globalId ?? "", title: title ?? "", speaker: speaker ?? "", speakerImageURL: speakerImageURL ?? "", rating: rating?.int ?? 0, githubUrl: githubUrl ?? "", dateTimestamp: dateTimestamp?.double  ?? 0.0)
    }
    
    func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "globalId": globalId,
            "title": title,
            "speaker": speaker,
            "speakerImageURL": speakerImageURL,
            "rating": rating,
            "githubUrl": githubUrl,
            "dateTimestamp": dateTimestamp
            ])
    }
    
    static func prepare(_ database: Database) throws {
        //
    }
    
    static func revert(_ database: Database) throws {
        //
    }
}

