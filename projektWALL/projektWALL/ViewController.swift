//
//  ViewController.swift
//  projektWALL
//
//  Created by Paul Maalouf on 11/19/16.
//  Copyright © 2016 slobros. All rights reserved.
//

import UIKit
import Alamofire
import ReSwift

class legislatorTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var partyLabel: UILabel!
    
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, StoreSubscriber {
    
    // MARK: IVARs
    var legislatorsDataSource: [Legislator] = []
    
    // MARK: IBOutlets

    @IBOutlet weak var legislatorTableView: UITableView!
    
    
    // MARK: State Handling
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        store.subscribe(self)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        store.unsubscribe(self)
    }
    

    func newState(state: LegislatorState) {
        
        if let allLegislators = store.state.legislators {
            switch allLegislators {
            case .success(let legislators):
                legislatorsDataSource = legislators
                legislatorTableView.reloadData()
                print(legislators)
            case .failure(let error):
                print(error)
            }
        } else {
            print("might be loading")
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: IBActions

    @IBAction func createButtonPressed(_ sender: AnyObject) {
        store.dispatch(getLegislators())
    }

    // MARK: Table View Delegate Protocol
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return legislatorsDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "legislatorCell", for: indexPath) as! legislatorTableViewCell
        let nextLegislator = legislatorsDataSource[indexPath.row]
        cell.nameLabel.text = nextLegislator.firstName + " " + nextLegislator.lastName
        cell.partyLabel.text = nextLegislator.state
        
        return cell
    }
    
}

