//
//  MainViewController.swift
//  Sunlit
//
//  Created by Vevek Selvam on 31/5/16.
//  Copyright © 2016 Vevek Selvam. All rights reserved.
//


import UIKit
import ForecastIO
import CoreLocation


class MainViewController: UIViewController, CLLocationManagerDelegate {
    
    let forecastIOClient = APIClient(apiKey: "236ecd8bf4a1bcf90ef96c84524268a6")
    var currentLocationLatitude: Double = 0.0
    var currentLocationLongitude: Double = 0.0
    
    var locationManager: CLLocationManager!
    
    
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!
    
    
    
    //MARK: View Did Load START
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //MARK: Location Manager Initialised START
        locationManager = CLLocationManager()
        locationManager.delegate = self;
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        
        //MARK: Forecast.io Unit Set up START
        forecastIOClient.units = .SI
        
        
        //MARK: Forecast.io Funtion START
        forecastIOClient.getForecast(latitude: currentLocationLatitude, longitude: currentLocationLongitude) { (currentForecast, error) -> Void in
            if let currentForecast = currentForecast {
                //  We got the current forecast!
                self.Label1.text = String(currentForecast.currently?.summary)
                //self.Label2.text = currentForecast.currently.debugDescription
            }
            //Handle Error
            //else if let error = error {Uh-oh we have an error!}
        }
        
        
    }
    
    //MARK: Location Manager Funtion START
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        var userLocation:CLLocation = locations[0] as! CLLocation
        let currentLocationLongitude = userLocation.coordinate.longitude;
        let currentLocationLatitude = userLocation.coordinate.latitude;
        
        //Do What ever you want with it
        self.Label2.text = String(currentLocationLongitude)
        
    }
    

    //MARK: Did Receive Memory Warning START
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

