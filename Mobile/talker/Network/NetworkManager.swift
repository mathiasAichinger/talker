//
//  NetworkManager.swift
//  talker
//
//  Created by Mathias Aichinger on 18/11/2016.
//  Copyright © 2016 Easysolutions. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Kakapo
import TalkerFramework

class NetworkManager {
    
    let talksDidChange = ObserverSet<[Talk]>()
    var talks: [ClientTalk] = [] {
        didSet {
            talksDidChange.notify(talks)
        }
    }
    
    private lazy var manager: SessionManager = {
        let configuration: URLSessionConfiguration = {
            let configuration = URLSessionConfiguration.default
            configuration.protocolClasses = [Server.self]
            return configuration
        }()
        
        return SessionManager(configuration: configuration)
    }()
    
    
    func requestTalks() {
        manager.request("http://localhost:8080/talks", method: .get).responseJSON { [weak self] (response) in
            guard let data = response.data else { return }
            let json = JSON(data: data)
            for jsonTalk: JSON in json.arrayValue {
                var talk = ClientTalk(json: jsonTalk)
                if let speakerId = talk.speakerId {
                    self?.requestSpeaker(with: speakerId, completion: { (speaker) in
                        talk.loadedSpeaker = speaker
                        self?.talks.append(talk)
                        self?.talksDidChange.notify((self?.talks)!)
                    })
                }
            }
        }
    }
    
    func requestSpeaker(with id: String, completion: @escaping (_ speaker: ClientSpeaker) -> Void) {
        manager.request("http://localhost:8080/speakers/\(id)", method: .get).responseJSON {(response) in
            guard let data = response.data else { return }
            let json = JSON(data: data)
            completion(ClientSpeaker(json: json))
        }
    }
    
    func requestCreate(feedback: ClientFeedback, completion: @escaping (_ feedback: ClientFeedback) -> Void) {
        //let body = JSON(feedback.dictionaryRepresentation()).rawString()
        
        Alamofire.request("http://localhost:8080/feedbacks", method: .post, parameters: feedback.dictionaryRepresentation(), encoding: JSONEncoding.default).responseJSON {(response) in
            guard let data = response.data else { return }
            let json = JSON(data: data)
            completion(ClientFeedback(json: json))
        }
    }
        
        //manager.request("http://localhost:8080/feedbacks", method: .post, parameters: nil, encoding: body!).    }
    
}

extension String: ParameterEncoding {
    
    public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
        var request = try urlRequest.asURLRequest()
        request.httpBody = data(using: .utf8, allowLossyConversion: false)
        return request
    }
}
