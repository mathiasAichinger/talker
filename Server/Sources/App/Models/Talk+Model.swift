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

extension Talk: Model {

    public var id: Node? {
        set {
            serverId = newValue?.string
        }
        get {
            guard let globalId = serverId else {
                return nil
            }
            return Node.string(globalId)
        }
    }
    
    public init(node: Node, in context: Context) throws {
        serverId = try node.extract("id")
        title = try node.extract("title")
        descriptionText = try node.extract("descriptionText")
        averageRating = try node.extract("averageRating")
        githubUrl = try node.extract("githubUrl")
        dateTimestamp = try node.extract("dateTimestamp")
        speakerId = try node.extract("speakerId")
        loadedSpeaker = nil
    }
    
    public func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "serverId": serverId ?? id?.string,
            "title": title,
            "descriptionText": descriptionText,
            "averageRating": averageRating,
            "githubUrl": githubUrl,
            "dateTimestamp": dateTimestamp,
            "speakerId": speakerId
            ])
    }
    
    public static func prepare(_ database: Database) throws {
        //
    }
    
    public static func revert(_ database: Database) throws {
        //
    }
}

