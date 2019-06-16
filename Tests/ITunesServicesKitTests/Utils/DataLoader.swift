//
//  File.swift
//  
//
//  Created by Mark Struzinski on 6/14/19.
//

import Foundation

class DataLoader {
    func loadData(for fileName: String) -> Data {
        let bundle = Bundle(for: type(of: self))
        guard let url = bundle.url(forResource: fileName,
                                   withExtension: "json") else {
                                        fatalError("Invalid data rsource")
        }
        
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Invalid data at path")
        }
        
        return data
    }
}
