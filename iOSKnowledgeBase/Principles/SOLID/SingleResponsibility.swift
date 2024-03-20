//
//  SingleResponsibility.swift
//  iOSKnowledgeBase
//
//  Created by Nazar Kozak on 18.03.2024.
//

import Foundation

/// Single Responsibility Principle (SRP): A class should have only one reason to change, meaning that it should only have one responsibility.
/// In this example, there's a FileManager class responsible for saving and loading data from a file, adhering to the SRP. Similarly, there's a DataManager class responsible for processing data.

class FileManager {
    func saveData(_ data: Data, to filePath: String) {
        // Code to save data to file
    }

    func loadData(from filePath: String) -> Data? {
        // Code to load data from file
        return nil
    }
}

class DataManager {
    func processData(_ data: Data) {
        // Code to process data
    }
}
