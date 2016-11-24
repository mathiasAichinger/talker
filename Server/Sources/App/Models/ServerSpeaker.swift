//
//  Speaker+Model.swift
//  talker-server
//
//  Created by Mathias Aichinger on 22/11/2016.
//
//
import Foundation
import Vapor
import Fluent
import TalkerFramework

class ServerSpeaker: Speaker, Model {
    
    public var id: Node? {
        didSet {
            serverId = id?.string
        }
    }
    
    public required init(node: Node, in context: Context) throws {
        let serverId: String? = try node.extract("serverId")
        id = try node.extract("id")
        if let serverId = serverId, id == nil {
            id = Node.string(serverId)
        }
        let speakerName: String = try node.extract("speakerName")
        let speakerImageURL: String? = try node.extract("speakerImageURL")
        super.init(serverId: serverId, speakerName: speakerName, speakerImageURL: speakerImageURL)
    }
    
    public func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "id": id,
            "serverId": serverId,
            "speakerName": speakerName,
            "speakerImageURL": speakerImageURL
            ])
    }
    
    public static func prepare(_ database: Database) throws {
        //
    }
    
    public static func revert(_ database: Database) throws {
        //
    }
}
