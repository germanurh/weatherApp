//
//  ViewController.swift
//  WeatherApp
//
//  Created by Герман Юрченко on 14.01.21.
//

import UIKit

class ViewController: UIViewController {
    
    static var locationName: String?
    static var temperature: Double?

        
    @IBOutlet weak var minskViewOutlet: UIView!
    @IBOutlet weak var brestViewOutlet: UIView!
    @IBOutlet weak var grodnoViewOutlet: UIView!
    @IBOutlet weak var gomelViewOutlwt: UIView!
    @IBOutlet weak var mogilevViewOutlet: UIView!
    @IBOutlet weak var vitebskViewOutlet: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        corner()
        navigationController?.setNavigationBarHidden(true, animated: true)
        buttonClicked(city: "Minsk")
        buttonClicked(city: "Brest")
        buttonClicked(city: "Grodno")
        buttonClicked(city: "Gomel")
        buttonClicked(city: "Mogilev")
        buttonClicked(city: "Vitebsk")
    }
    
    @IBAction func minskButton(_ sender: UIButton) {
        buttonClicked(city: "Minsk")
        showStoryboard()
    }
    
    @IBAction func brestButton(_ sender: UIButton) {
        buttonClicked(city: "Brest")
        showStoryboard()
    }
    
    @IBAction func grodnoButtton(_ sender: UIButton) {
        buttonClicked(city: "Grodno")
        showStoryboard()
        
    }
    
    @IBAction func gomelButton(_ sender: UIButton) {
        buttonClicked(city: "Gomel")
        showStoryboard()
    }
    
    @IBAction func mogilevButton(_ sender: UIButton) {
        buttonClicked(city: "Mogilev")
        showStoryboard()
    }
    
    @IBAction func vitebskButton(_ sender: UIButton) {
        buttonClicked(city: "Vitebsk")
        showStoryboard()
    }
    
    func buttonClicked(city: String) {
        let urlString = "https://api.weatherapi.com/v1/current.json?key=72cb431bb5fb4a8aaa1221355211501&q=\(city)"
        let url = URL(string: urlString)
        
        
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers)
                as! [String : AnyObject]
                
                if let location = json["location"] {
                    ViewController.locationName = location["name"] as? String
                }
                
                if let current = json["current"] {
                    ViewController.temperature = current["temp_c"] as? Double
                
              
                    
                }
            }
            
            catch let jsonError {
                print(jsonError)
            }
        }
        task.resume()
    }
    
    func corner() {
        minskViewOutlet.layer.cornerRadius = 7
        brestViewOutlet.layer.cornerRadius = 7
        grodnoViewOutlet.layer.cornerRadius = 7
        gomelViewOutlwt.layer.cornerRadius = 7
        mogilevViewOutlet.layer.cornerRadius = 7
        vitebskViewOutlet.layer.cornerRadius = 7
    }
    
    func showStoryboard() {
        let storyboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        let viewController = storyboard.instantiateViewController(identifier: "WeatherViewController")
        navigationController?.pushViewController(viewController, animated: true)
    }

}



