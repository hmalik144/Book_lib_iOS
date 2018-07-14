//
//  ViewController.swift
//  Books_App
//
//  Created by h_mal on 09/07/2018.
//  Copyright © 2018 h_mal. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var searchTermResult = "ios"
    var noOfResults = 20
    
    @IBAction func refineSearch(_ sender: Any) {
        performSegue(withIdentifier: "segueOne", sender: self)
    }

    var booksArray = [AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        downloadData()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return booksArray.count
    }
    

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let book = booksArray[indexPath.row]["volumeInfo"] as? Dictionary<String, AnyObject>
        let title = book?["title"] as? String
        let authors = book?["authors"] as? [AnyObject]
        var authorString = ""
        if (authors?.count)! >= 1 && !(authors?.isEmpty)! {
            for author in authors!{
                authorString = (author as! String) + ", "
                }
        }
//        var authorString = ""
//        if (authors?.count)! > 1{

//        }else{
//            authorString = (authors?[0] as? String)!
//            }
        cell.bookName.text = title
        cell.bookAuthors.text = authorString
        return cell
    }
    
//    public func tableView(tableView:UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        print("selected: \(indexPath.row)")
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("section: #\(indexPath.row)!")
        let book = booksArray[indexPath.row]["volumeInfo"] as? Dictionary<String, AnyObject>
        let url = URL(string: (book?["infoLink"])! as! String)
        UIApplication.shared.open(url!, options: [:])
    }
    
    func downloadData() {
        Alamofire.request(urlBuilder()).responseJSON { response in

            if let json = response.result.value as? Dictionary<String,AnyObject> {
                if let innerDict = json["items"]{
                    self.booksArray = innerDict as! [AnyObject]
                    self.tableView.reloadData()
                    print(self.urlBuilder())
                }
            }
        }
    }
    
    func urlBuilder() -> String{
        
        var url = "https://www.googleapis.com/books/v1/volumes?"
        url = url + "q=" + searchTermResult + "&maxResults=" + noOfResults.description
        
        print(url)
        
        return url
    }

}

