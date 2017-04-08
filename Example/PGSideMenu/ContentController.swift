//
//  ContentController.swift
//  PGSideMenu
//
//  Created by Piotr Gorzelany on 27/05/16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit
import PGSideMenu

class ContentController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: Properties
    
    var currentAnimationType: PGSideMenuAnimationType = .slideIn
    
    // MARK: Initializers
    
    init() {
        super.init(nibName: "ContentController", bundle: Bundle.main)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureController()
    }
    
    // MARK: Actions
    
    @IBAction func rightButtonTouched(_ sender: UIButton) {
        if let sideMenuController = self.parent as? PGSideMenu {
            sideMenuController.toggleRightMenu()
        }
    }
    
    @IBAction func leftButtonTouched(_ sender: UIButton) {
        if let sideMenuController = self.parent as? PGSideMenu {
            sideMenuController.toggleLeftMenu()
        }
    }
    
    
    // MARK: Support
    
    func configureController() {
        if let sideMenu = self.parent as? PGSideMenu {
            sideMenu.animationType = self.currentAnimationType
        }
        self.configureTableView()
    }
    
    func configureTableView() {
        let nib = UINib(nibName: "AnimationTypeTableCell", bundle: Bundle.main)
        self.tableView.register(nib, forCellReuseIdentifier: "AnimationTypeTableCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
}

extension ContentController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PGSideMenuAnimationType.values.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnimationTypeTableCell", for: indexPath) as! AnimationTypeTableCell
        let animationType = PGSideMenuAnimationType.values[indexPath.row]
        cell.configure(with: animationType, active: animationType == self.currentAnimationType)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let animationType = PGSideMenuAnimationType.values[indexPath.row]
        
        if let sideMenu = self.parent as? PGSideMenu {
            sideMenu.animationType = animationType
            self.currentAnimationType = animationType
            self.tableView.reloadData()
        }
    }
}
