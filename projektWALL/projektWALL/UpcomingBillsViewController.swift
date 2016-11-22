//
//  UpcomingBillsViewController.swift
//  projektWALL
//
//  Created by Amir Saifi on 11/19/16.
//  Copyright © 2016 slobros. All rights reserved.
//

import UIKit
import ReSwift
import Alamofire

class UpcomingBillsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, StoreSubscriber {
    
    // MARK: - IVARs
    var upcomingBills = [UpcomingBill]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    // MARK: - IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - State Handling
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        store.subscribe(self)
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        store.unsubscribe(self)
    }
    
    
    func newState(state: RootState) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Helper Methods
    struct Storyboard {
        static let upcomingBillCell = "Upcoming Bill Cell"
    }
    
    
    // MARK: - IBActions
    @IBAction func getAllBills(_ sender: UIButton) {
    }
    @IBAction func getRecentBills(_ sender: UIButton) {
    }
    
    
    // MARK: - Table View Delegate Protocol
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return upcomingBills.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.upcomingBillCell, for: indexPath)
        let upcomingBill = upcomingBills[indexPath.row]
        
        cell.textLabel?.text = "Bill ID: \(upcomingBill.billID)"
        cell.detailTextLabel?.text = upcomingBill.context
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
