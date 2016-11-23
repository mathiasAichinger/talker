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

extension Speaker: Model {
    
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
        serverId = try node.extract("serverId")
        speakerName = try node.extract("speakerName")
        speakerImageURL = try node.extract("speakerImageURL")
    }
    
    public func makeNode(context: Context) throws -> Node {
        return try Node(node: [
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
