//
//  StateTableViewCell.swift
//  MAD_Ind04_Philip_Lijo
//
//  Created by Lijo Philip on 3/22/22.
//

import UIKit

// Rendering a cell row out in UITableView
class StateTableViewCell: UITableViewCell {
    
    // TableView of the 50 states with name and nickname label connected.
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    

    private var urlString: String = ""
    
    // Creating a state object.
    func updateCell(_ state:State) {
        reloadUI(name: state.name, nickname: state.nickname)
    }
    
    // Configure the view for the selected state.
    private func reloadUI(name: String?, nickname: String?) {
        self.nameLabel.text = name
        self.nicknameLabel.text = nickname
        
    }
}
