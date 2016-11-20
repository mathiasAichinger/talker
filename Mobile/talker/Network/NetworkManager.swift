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
            self?.talks = json.arrayValue.map { (talk) -> Talk in
                return ClientTalk(json: talk)
            }
        }
    }
    
}
