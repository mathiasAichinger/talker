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
    var talks: [Talk] = [] {
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
                var talk = Talk(json: jsonTalk)
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
    
    func requestSpeaker(with id: String, completion: @escaping (_ speaker: Speaker) -> Void) {
        manager.request("http://localhost:8080/speakers/\(id)", method: .get).responseJSON {(response) in
            guard let data = response.data else { return }
            let json = JSON(data: data)
            completion(Speaker(json: json))
        }
    }
    
}
