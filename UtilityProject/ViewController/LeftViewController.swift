//
//  LeftViewController.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 12/3/14.
//

import UIKit

enum LeftMenu: Int {
    case main = 0
    case commonUIProperty
    case commonNavbarToAllVC
    case emailValidationUtility
    case dateUtility
    case java
    case nonMenu
}

protocol LeftMenuProtocol : class {
    func changeViewController(_ menu: LeftMenu)
}

class LeftViewController : UIViewController, LeftMenuProtocol {
    
    @IBOutlet weak var tableView: UITableView!
    var menus = ["Main", "UIView Utility", "Common NavBarExtension", "Email Validation","Date Time Utility", "Non Menu"]
    var mainViewController: UIViewController!
    var customUIUtilityViewController: UIViewController!
    var commonNavbarExtensionVC: UIViewController!
    var emailValidityViewController: UIViewController!
    var dateOperation: UIViewController!


    var javaViewController: UIViewController!
    var goViewController: UIViewController!
    var nonMenuViewController: UIViewController!
    
    var imageHeaderView: ImageHeaderView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.separatorColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1.0)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let uiUtilityViewController = storyboard.instantiateViewController(withIdentifier: "CustomUIDecoration") as! CustomUIUtilityViewController
        self.customUIUtilityViewController = UINavigationController(rootViewController: uiUtilityViewController)
        
        
        let navbarExtensionVC = storyboard.instantiateViewController(withIdentifier: "NavbarExtension") as! AddNavigationbarViewController
        self.commonNavbarExtensionVC = UINavigationController(rootViewController: navbarExtensionVC)
        
        let emailOperationVC = storyboard.instantiateViewController(withIdentifier: "EmailValidityViewController") as! EmailValidityViewController
        self.emailValidityViewController = UINavigationController(rootViewController: emailOperationVC)

        
        let dateExtensionVC = storyboard.instantiateViewController(withIdentifier: "DateOperation") as! DateOperationViewController
        self.dateOperation = UINavigationController(rootViewController: dateExtensionVC)
        /*
        let javaViewController = storyboard.instantiateViewController(withIdentifier: "JavaViewController") as! JavaViewController
        self.javaViewController = UINavigationController(rootViewController: javaViewController)
        
        let goViewController = storyboard.instantiateViewController(withIdentifier: "GoViewController") as! GoViewController
        self.goViewController = UINavigationController(rootViewController: goViewController)
        
        let nonMenuController = storyboard.instantiateViewController(withIdentifier: "NonMenuController") as! NonMenuController
        nonMenuController.delegate = self
        self.nonMenuViewController = UINavigationController(rootViewController: nonMenuController)
*/
        self.tableView.registerCellClass(BaseTableViewCell.self)
        
        self.imageHeaderView = ImageHeaderView.loadNib()
        self.view.addSubview(self.imageHeaderView)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.imageHeaderView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 160)
        self.view.layoutIfNeeded()
    }
    
    func changeViewController(_ menu: LeftMenu) {
        switch menu {
        case .main:
            self.slideMenuController()?.changeMainViewController(self.mainViewController, close: true)
        case .commonUIProperty:
            self.slideMenuController()?.changeMainViewController(self.customUIUtilityViewController, close: true)
        case .commonNavbarToAllVC:
            self.slideMenuController()?.changeMainViewController(self.commonNavbarExtensionVC, close: true)
        case .java:
            self.slideMenuController()?.changeMainViewController(self.javaViewController, close: true)
        case .emailValidationUtility: self.slideMenuController()?.changeMainViewController(self.emailValidityViewController, close: true)

        case .dateUtility: self.slideMenuController()?.changeMainViewController(self.dateOperation, close: true)
            
        case .nonMenu:
            self.slideMenuController()?.changeMainViewController(self.nonMenuViewController, close: true)
        }
    }
}

extension LeftViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return BaseTableViewCell.height()
//        if let menu = LeftMenu(rawValue: indexPath.row) {
//            switch menu {
//            case .main, .commonUIProperty,.commonNavbarToAllVC, .java, .emailValidationUtility,.dateUtility,.nonMenu:
//
//            }
//        }
//        return 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let menu = LeftMenu(rawValue: indexPath.row) {
            self.changeViewController(menu)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.tableView == scrollView {
            
        }
    }
}

extension LeftViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let menu = LeftMenu(rawValue: indexPath.row) {
            switch menu {
            case .main, .commonUIProperty,.commonNavbarToAllVC, .java, .emailValidationUtility,.dateUtility, .nonMenu:
                let cell = BaseTableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: BaseTableViewCell.identifier)
                cell.setData(menus[indexPath.row])
                return cell
            }
        }
        return UITableViewCell()
    }
    
    
}
