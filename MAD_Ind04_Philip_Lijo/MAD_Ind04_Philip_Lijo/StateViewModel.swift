//
//  StateViewModel.swift
//  MAD_Ind04_Philip_Lijo
//
//  Created by Lijo Philip on 3/22/22.
//


import Foundation

class StateViewModel {
    
    private var csxApiService = csxAPI()
    private var allStates = [State]()
    
    // A portion of the code is refrenced and modified from https://www.freecodecamp.org/news/how-to-make-your-first-api-call-in-swift/ (3/30/22)
    func fetchStateData(completion: @escaping () -> ()) {
        
        // Optimize avoiding retain cycles.
        csxApiService.loadStateData { [weak self] (result) in
            
            switch result {
            case .success(let listOf):
                self?.allStates = listOf.states
                completion()
            case .failure(let error):
                // Error with JSON file.
                print("JSON Error: \(error)")
            }
        }
    }
    
    // Returning each row from our state names to create 50 rows.
    func numberOfRowsInSection(section: Int) -> Int {
        if allStates.count != 0 {
            return allStates.count
        }
        return 0
    }
    
    // Returning state names, nicknames in each cell row in TableView.
    func cellForRowAt (indexPath: IndexPath) -> State {
        return allStates[indexPath.row]
    }
}
