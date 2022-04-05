//
//  ApiService.swift
//  MAD_Ind04_Philip_Lijo
//
//  Created by Lijo Philip on 3/22/22.
//

import Foundation

class csxAPI {
    // A portion of the code is refrenced and modified from https://www.freecodecamp.org/news/how-to-make-your-first-api-call-in-swift/ (3/31/22)
    private var databaseTask: URLSessionDataTask?
    
    func loadStateData(completion: @escaping (Result<StatesData, Error>) -> Void) {
        
        let statesURL = "https://webmail.cs.okstate.edu/~liphili/states.php"
        
        guard let url = URL(string: statesURL) else {return}
        
        // Create URL Session - work on the background
        databaseTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            // Handeling data task errors.
            if let error = error {
                completion(.failure(error))
                print("Task Error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                // Handeling responses errors.
                print("Response Error")
                return
            }
            print("Response Code: \(response.statusCode)")
            
            guard let data = data else {
                // Handeling empty list error.
                print("List is Empty")
                return
            }
            
            do {
                // Parse the data
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(StatesData.self, from: data)
                
                // Back to the main thread
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            } catch let error {
                completion(.failure(error))
            }
            
        }
        databaseTask?.resume()
    }
}
