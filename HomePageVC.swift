//
//  HomePageVC.swift
//  weatherAppiOS
//
//  Created by Robin George on 27/10/21.
//

import UIKit

import CoreLocation

class HomePageVC: UIViewController, UITableViewDelegate, CLLocationManagerDelegate {



    @IBOutlet weak var weatherTable: UITableView!
    
    var weather = [Weather]()
    
    let locationManager = CLLocationManager()
    var currentLocation : CLLocation?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView delegates
        weatherTable.delegate = self
        weatherTable.dataSource = self
        
        
        //register cell
        
        weatherTable.register(HourlyCollectionViewCell.nib(), forCellReuseIdentifier: "HourlyCollectionViewCell")
        weatherTable.register(WeatherCell.nib(), forCellReuseIdentifier: "WeatherCell ")
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !locations.isEmpty, currentLocation == nil{
            currentLocation =  locations.first
            locationManager.stopUpdatingLocation()
            
        }
    }
    //location
    
    func setupLocation(){
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }

 
}



extension HomePageVC : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weather.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

struct Weather {
    
}
