//
//  ShiitakeList.swift
//  instagram
//
//  Created by Alek Michelson on 1/14/21.
//  Copyright © 2021 Alek Michelson. All rights reserved.
//

import Foundation

// Loads array of drinks from the file
let growableMushroomData:[GrowableMushroom] = load("growableMushrooms.json")
let indexMushroomData:[IndexMushroom] = load("indexMushrooms.json")

func load<T:Decodable>(_ filename:String, as type:T.Type = T.self) -> T {
    let data:Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Could not find \(filename) in main bundle.")
    }
    
    // Gets the data stored in file
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could not load \(filename) from main bundle:\n\(error)")
    }
    
    // Puts all data into the correct model format
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Could not parse \(filename) as \(T.self):\n\(error)")
    }
}
 
