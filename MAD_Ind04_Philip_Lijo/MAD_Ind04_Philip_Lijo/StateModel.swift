//
//  Model.swift
//  MAD_Ind04_Philip_Lijo
//
//  Created by Lijo Philip on 3/22/22.
//

import Foundation

// Creating a state object with name and nickname.
struct StatesData: Decodable {
    
    let states: [State]
    
    private enum CodingKeys: String, CodingKey {
        case states = "states"
        
    }
}

struct State: Decodable {
    
    let name: String?
    let nickname: String?
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case nickname = "nickname"
    }
}
