//
//  NameManager.swift
//  DemoData
//
//  Created by Raunak Sinha on 20/05/21.
//

import Foundation



protocol NameManagerDelegate {
    func didUpdateName(_ names: [String])
    func didFailWithError(error: Error)
}


struct NameManager {
    let api = "https://api.jsonbin.io/b/5ec3b9a9e91d1e45d10d0700"
    
    var delegate: NameManagerDelegate?
    
    func getNames() {
        if let url = URL(string: api) {
            performUrl(for: url)
        }
    }
    
    func performUrl(for url: URL) {
        let session = URLSession(configuration: .default)
        session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                delegate?.didFailWithError(error: error!)
            }
            if let safeData = data {
                if let names = parseJson(nameData: safeData) {
                        self.delegate?.didUpdateName(names)
                    
                }
            }
        }.resume()
    }
    
    
    func parseJson(nameData: Data) -> [String]? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(NameData.self, from: nameData)
            return decodedData.names
        }catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
