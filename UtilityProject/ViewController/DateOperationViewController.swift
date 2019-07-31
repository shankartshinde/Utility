//
//  DateOperationViewController.swift
//  UtilityProject
//
//  Created by shankars on 2/12/19.
//  Copyright © 2019 shankars. All rights reserved.
//

import UIKit

class DateOperationViewController: UIViewController {
    
    @IBOutlet weak var outputTimeConversion: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setNavigationBarItem()
        outputTimeConversion.text = "Output Time converted ::" + timeConversion(inputTime: "07:05:45PM")
        outputTimeConversion.backgroundColor = .yellow
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func timeConversion(inputTime: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm:ssa"
        
        var fullDate = dateFormatter.date(from: inputTime)
        
        //dateFormatter.dateFormat = "hh:mm:ss a"
        dateFormatter.dateFormat = "HH:mm:ss"
        
        var time2 = dateFormatter.string(from: fullDate!)
        return time2
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
