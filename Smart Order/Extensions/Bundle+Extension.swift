//
//  Bundle+Extension.swift
//  Smart Order
//
//  Created by Office on 12/7/22.
//

import Foundation

extension Bundle {
    /// Decode a json file to a specific  instance
    /// - parameter file: File path of the json in the project
    /// - parameter dateDecodingStrategy: Specify how date in json should be decoded
    /// - returns: Returns instance by decoding json
    func decode<T: Codable>(_ file: String, dateDecodingStrategy: JSONDecoder.DateDecodingStrategy? = nil) -> T {
         // 1. Locate the json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle.")
        }
        
        // 2. Create a property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from bundle.")
        }
        
        // 3. Create a decoder
        let decoder = JSONDecoder()
        
        // 4. Specify date decoding strategy if needed
        if let dateDecodingStrat = dateDecodingStrategy {
            decoder.dateDecodingStrategy = dateDecodingStrat
        }
        
        // 5. Create a property for the decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        // 6. Return the ready-to-use data
        return loaded
    }
}
