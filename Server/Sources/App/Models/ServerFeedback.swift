//
//  ServerFeedback+Model.swift
//  talker-server
//
//  Created by Mathias Aichinger on 22/11/2016.
//
//
import Foundation
import Vapor
import Fluent
import TalkerFramework

class ServerFeedback: Feedback, Model {
    
    public var id: Node? {
        didSet {
            serverId = id?.string
        }
    }
    
    public required init(node: Node, in context: Context) throws {
        let serverId: String? = try node.extract("serverId")
        id = try node.extract("id")
        let rating: Int = try node.extract("rating")
        let feedbackText: String = try node.extract("feedbackText")
        let talkId: String? = try node.extract("talkId")
        super.init(serverId: serverId, rating: rating, feedbackText: feedbackText, talkId: talkId)
    }
    
    public func makeNode(context: Context) throws -> Node {
        return try Node(node: [
            "id": id,
            "serverId": serverId,
            "rating": String(rating),
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
