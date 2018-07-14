//
//  SecondViewController.swift
//  Books_App
//
//  Created by h_mal on 13/07/2018.
//  Copyright © 2018 h_mal. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var searchTerm: UITextField!
    @IBOutlet weak var numResults: UITextField!
    
    @IBAction func submitButton(_ sender: Any) {
        performSegue(withIdentifier: "segueReturn", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let prevController = segue.destination as! ViewController
        prevController.searchTermResult = searchTerm.text!
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
