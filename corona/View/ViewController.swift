//
//  ViewController.swift
//  corona
//
//  Created by Яблочко on 01.11.2020.
//  Copyright © 2020 Roman Avdonin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var covidLabel: UILabel!
    @IBOutlet weak var deathsLabel: UILabel!
    @IBOutlet weak var cases: UILabel!
    @IBOutlet weak var activityLabel: UILabel!
    @IBOutlet weak var recoveredLabel: UILabel!
    
    
    let url = "https://corona.lmao.ninja/v3/covid-19/countries/russia"

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    
    
    
    @IBAction func enterButton(_ sender: UIButton) {
        
        getData(from: url)
        
    }
    
    func getData(from url: String) {
        
        
        
        let task =  URLSession.shared.dataTask(with: URL(string: url)!) { (data, responce, error) in
            
            guard let data = data, error == nil else { return }
            
            var result: CovidAll?
            do {
                
                result = try JSONDecoder().decode(CovidAll.self, from: data)
            } catch {
                print(error.localizedDescription)
            }
            
            guard let json = result else { return }
            DispatchQueue.main.async {
                self.activityLabel.text = "Болеют: \(json.active) человек"
                self.cases.text = "Всего болело: \(json.cases) человек"
                self.deathsLabel.text = "Смертей: \(json.deaths) человек"
                self.recoveredLabel.text = "Выздоровили: \(json.recovered) человек"
            }
        }
        task.resume()
    }
    
}



