//
//  TalkListViewModel.swift
//  talker
//
//  Created by Mathias Aichinger on 18/11/2016.
//  Copyright © 2016 Easysolutions. All rights reserved.
//

import UIKit
import TalkerFramework

struct TalkListViewModel {

    var talks: [Talk]
    
    init(talks: [Talk]) {
        self.talks = talks
    }
}
