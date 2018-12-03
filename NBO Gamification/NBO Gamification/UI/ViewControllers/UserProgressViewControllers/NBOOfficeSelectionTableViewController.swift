//
//  NBOOfficeSelectionTableViewController.swift
//  NBO Gamification
//
//  Created by facundop on 03/12/2018.
//  Copyright © 2018 nbogamification. All rights reserved.
//

import UIKit

protocol NBOOfficeSelectionViewControllerDelegate {
    func nboOfficeSelectionViewControllerDidSelectOffice (selectedOffice : NBOOffice, _ NBOOfficeSelectionVC: NBOOfficeSelectionTableViewController)
}

class NBOOfficeSelectionTableViewController: UITableViewController {
    
    var delegate: NBOOfficeSelectionViewControllerDelegate?
    var officeList : [NBOOffice] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(UINib(nibName: NBOOfficeSelectionTableViewCell.cellIdentifier, bundle: nil), forCellReuseIdentifier: NBOOfficeSelectionTableViewCell.cellIdentifier)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return officeList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : NBOOfficeSelectionTableViewCell = tableView.dequeueReusableCell(withIdentifier: NBOOfficeSelectionTableViewCell.cellIdentifier, for: indexPath) as! NBOOfficeSelectionTableViewCell
        let office = officeList[indexPath.row]
        
        cell.officeName?.text = office.name
        
        return cell
    }
    
    // MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.nboOfficeSelectionViewControllerDidSelectOffice(selectedOffice: officeList[indexPath.row], self)
    }
}
