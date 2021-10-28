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
    
    var weather = [WeatherData]()
    
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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        setupLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if !locations.isEmpty, currentLocation == nil{
            currentLocation =  locations.first
            locationManager.stopUpdatingLocation()
            weatherForLocation()
            
            
        }
    }
    
    func weatherForLocation(){
        guard let currentLocation = currentLocation else {
            return
        }
        let long = currentLocation.coordinate.longitude
        let lat = currentLocation.coordinate.latitude
        
        print("\(long)| \(lat) ")
        
        let url = "api.openweathermap.org/data/2.5/weather?lat=37.785834&lon=-122.406417&appid=7a6f50d61e91ebe14eca463f3afd0895"
//        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler:
//         { data, response, error in
//            guard let data = data , error == nil else {
//                return
//            }
            
            URLSession.shared.dataTask(with: URL(string: url)!,completionHandler: {data, response, error in
                //validation
                guard let data = data, error == nil else {

                    return
                }
            
      
        var json: WeatherData?
        
        do {
            json = try JSONDecoder().decode(WeatherData.self,from: data)
        } catch  {
            print("error")
        }
            
            guard let  result = json else {
                return
            }
            print(result.weather)
        }).resume()
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

struct WeatherData : Codable{
    var weather : [Details]
}

struct Details : Codable{
    var id : Int
    var main : String
    var description : String
    var icon : String
    
}
