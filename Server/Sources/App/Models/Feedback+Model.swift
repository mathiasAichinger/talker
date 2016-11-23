//
//  Feedback+Model.swift
//  talker-server
//
//  Created by Mathias Aichinger on 22/11/2016.
//
//
import Foundation
import Vapor
import Fluent
import TalkerFramework

extension Feedback: Model {
    
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
        rating = try node.extract("rating")
        feedbackText = try node.extract("feedbackText")
        talkId = try node.extract("talkId")
    }
    
    public func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "serverId": serverId,
            "rating": rating,
            "feedbackText": feedbackText,
            "talkId": talkId
            ])
    }
    
    public static func prepare(_ database: Database) throws {
        //
    }
    
    public static func revert(_ database: Database) throws {
        //
    }
}
