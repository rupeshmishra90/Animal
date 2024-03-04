//
//  CodableBundleExtension.swift
//  Animal
//
//  Created by Rupesh Mishra on 20/02/24.
//

import Foundation

extension Bundle{
    func decode<T: Codable>(_ file: String)-> T?{
        //1. Locate the json file
        guard let url = self.url(forResource: file, withExtension: nil) else{
            print("Invalid url")
            return nil
        }
        //2. Create a property for the data
        guard let data = try? Data(contentsOf: url) else{
            print("Unable to retrieve the data")
            return nil
        }
        //3. Create a decoder
        let decoder = JSONDecoder()
        //4. Create a property for the decoded data
        
        guard let loadedData = try? decoder.decode(T.self, from: data) else{
            print("Unable to decode data")
            return nil
        }
        return loadedData
    }
}
