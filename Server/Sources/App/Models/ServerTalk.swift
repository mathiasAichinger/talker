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

class ServerTalk: Talk, Model {

    public var id: Node? {
        didSet {
            serverId = id?.string
        }
    }
    
    public required init(node: Node, in context: Context) throws {
        let serverId: String? = try node.extract("serverId")
        id = try node.extract("id")
        let title: String = try node.extract("title")
        let descriptionText: String = try node.extract("descriptionText")
        let averageRating: Double = try node.extract("averageRating")
        let githubUrl: String? = try node.extract("githubUrl")
        let dateTimestamp: Double = try node.extract("dateTimestamp")
        let speakerId: String? = try node.extract("speakerId")
        super.init(serverId: serverId, title: title, descriptionText: descriptionText, githubUrl: githubUrl, dateTimestamp: dateTimestamp, averageRating: averageRating, speakerId: speakerId)
        
    }
    
    public func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "id": id,
            "serverId": serverId,
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

