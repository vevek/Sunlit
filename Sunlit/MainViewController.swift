//
//  MainViewController.swift
//  Sunlit
//
//  Created by Vevek Selvam on 31/5/16.
//  Copyright © 2016 Vevek Selvam. All rights reserved.
//


import UIKit
import ForecastIO


class MainViewController: UIViewController {
    
    let forecastIOClient = APIClient(apiKey: "236ecd8bf4a1bcf90ef96c84524268a6")
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        forecastIOClient.units = .SI
        
        forecastIOClient.getForecast(latitude: 1.352083, longitude: 103.819836) { (currentForecast, error) -> Void in
            if let currentForecast = currentForecast {
                //  We got the current forecast!
                self.Label1.text = currentForecast.hourly?.data?.description
                self.Label2.text = currentForecast.daily?.data?.description
            } else if let error = error {
                //  Uh-oh we have an error!
            }
        }
        
        
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

