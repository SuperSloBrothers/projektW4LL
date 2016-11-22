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
    
    let urlString = "https://congress.api.sunlightfoundation.com/upcoming_bills"
    var filterString = ""
    
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - State Handling
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        store.subscribe(self)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        store.unsubscribe(self)
    }
    
    func newState(state: RootState) {
        if let result = state.upcomingBillsState.upcomingBills {
            switch result {
            case .success(let bills):
                upcomingBills = bills
                print("success: received new bills")
            case .failure(let error):
                print("error: \(error)")
            }
        } else {
            print("retrieving data or default state")
        }
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
        store.dispatch(getUpcomingBills())
    }
    
    @IBAction func houseBillsOnly(_ sender: UIButton) {
        filterString = "?chamber=house"
        store.dispatch(getUpcomingBills(url: URL(string: urlString + filterString)!))
    }
    
    
    // MARK: - Table View Delegate Protocol
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return upcomingBills.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Storyboard.upcomingBillCell, for: indexPath)
        let upcomingBill = upcomingBills[indexPath.row]
        
        cell.textLabel?.text = "Bill ID: \(upcomingBill.billID!), Chamber: \(upcomingBill.chamber!)"
        cell.detailTextLabel?.text = "Scheduled on \(upcomingBill.legislativeDay!)"
        
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
