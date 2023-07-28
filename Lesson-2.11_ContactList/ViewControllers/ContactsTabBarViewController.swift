//
//  PersonsListViewController.swift
//  Lesson-2.11_ContactList
//
//  Created by Юрий Куринной on 28.07.2023.
//

import UIKit

final class ContactsTabBarViewController: UITabBarController {
    
    // MARK: - Private properties
    
    fileprivate let personsList = Person.getPersons()
    
    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers?.forEach{ viewController in
            guard let navigationVC = viewController
                    as? UINavigationController else { return }
            
            if let contactListVC = navigationVC.topViewController
                as? PersonsListViewController {
                contactListVC.contactList = personsList
            } else if let fullContactListVC = navigationVC.topViewController
                        as? ContactListViewController {
                fullContactListVC.contactList = personsList
            }
        }
    }
}


