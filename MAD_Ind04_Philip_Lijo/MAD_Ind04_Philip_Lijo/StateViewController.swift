//
//  ViewController.swift
//  MAD_Ind04_Philip_Lijo
//
//  Created by Lijo Philip on 3/22/22.
//

import UIKit

class StateViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    // Storing all states
    private var viewModel = StateViewModel()
    var activityIndicator = UIActivityIndicatorView()
    
    // Function for spinner
    func setupActivityIndicator() {
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .large
        activityIndicator.color = UIColor.black
        view.addSubview(activityIndicator)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Start animating spinner while data is being fetched.
        setupActivityIndicator()
        activityIndicator.startAnimating()
        self.view.isUserInteractionEnabled = false
        
        loadStateData()
        
    }
    
    // Going through all state object values.
    private func loadStateData() {
        viewModel.fetchStateData { [weak self] in
            self?.tableView.dataSource = self
            self?.tableView.reloadData()
            
            // Stop animating spinner once table view finishes loading.
            self?.activityIndicator.stopAnimating()
            self?.view.isUserInteractionEnabled = true
            
        }
        
    }
    
    
}


extension StateViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    // Creating a cell using custom class.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "state_cell", for: indexPath) as! StateTableViewCell
        
        let state = viewModel.cellForRowAt(indexPath: indexPath)
        cell.updateCell(state)
        
        return cell
    }
}


