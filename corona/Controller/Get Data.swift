//
//  Get Data.swift
//  corona
//
//  Created by Яблочко on 09.11.2020.
//  Copyright © 2020 Roman Avdonin. All rights reserved.
//

import Foundation

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
