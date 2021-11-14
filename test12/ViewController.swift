//
//  ViewController.swift
//  test12
//
//  Created by بندر عبيد ثاري الرشيدي on 09/04/1443 AH.
//


import UIKit

struct Facts : Codable {
var fact : String
}

class ViewController: UIViewController {
   
    override func viewDidLoad() {
        super.viewDidLoad()
        getCharacters()
        // Do any additional setup after loading the view.
    }
    func getCharacters () {
        var id = URLComponents()
        id.scheme = "https"
        id.host = "dog-facts-api.herokuapp.com"
        id.path = "/api/v1/resources/dogs/all"
        
        let urIReqest = URLRequest(url: id.url!)
        let urlSession = URLSession.shared
        let task = urlSession.dataTask(with: urIReqest) { (data: Data?, responsse:URLResponse?,error: Error?) in
            
            do {
                let jsonDecDecoder = JSONDecoder()
                let idd = try jsonDecDecoder.decode([Facts].self, from:data!)
                print(idd)
            }catch {
                print("err: \(error)")
                
            }
            
        }
        task.resume()  }
    
}

