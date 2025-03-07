//
//  TabBarController.swift
//  ContactListApp
//
//  Created by Ast on 05.03.2025.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
    }
    
    //Выбор нужного экрана VC
    private func setupViewControllers() {
        let persons = Person.getContactList(from: DataStore())
        
        let contactListVC = viewControllers?.first as? ContactListViewController
        let sectionVC = viewControllers?.last as? SectionTableViewController
        
        contactListVC?.persons = persons
        sectionVC?.persons = persons
    }
}
