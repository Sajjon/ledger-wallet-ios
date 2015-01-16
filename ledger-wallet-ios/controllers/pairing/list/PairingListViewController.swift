//
//  PairingListViewController.swift
//  ledger-wallet-ios
//
//  Created by Nicolas Bigot on 13/01/2015.
//  Copyright (c) 2015 Ledger. All rights reserved.
//

import UIKit

class PairingListViewController: ViewController {
    
    @IBOutlet private weak var actionBar: ActionBarView!
    @IBOutlet private weak var pairingStatusLabel: Label!
    
    //MARK: Actions
    
    @IBAction private func pairNewDongleButtonTouched(sender: AnyObject) {
        let navigationController = NavigationController.instantiateFromStoryboard(storyboard)
        let addDongleViewController = PairingAddViewController.instantiateFromStoryboard(storyboard)
        navigationController.viewControllers = [addDongleViewController]
        presentViewController(navigationController, animated: true, completion: nil)
    }
    
    
    //MARK: Interface
    
    override func configureView() {
        super.configureView()
        
        actionBar.borderPosition = ActionBarView.BorderPosition.Top
        pairingStatusLabel.text = localizedString("WAITING_FOR_AN_OPERATION")
    }
    
    override func updateView() {
        super.updateView()
        
        dispatch_async(dispatch_get_main_queue(), {
            self.pairNewDongleButtonTouched(self.actionBar)
        })
    }
    
}

extension PairingListViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Tableview methods
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PairingListTableViewCell", forIndexPath: indexPath) as PairingListTableViewCell
        return cell
    }
    
}