//
//  SWAPI_Helper.swift
//  swapi
//
//  Created by Vamsi Allu on 2022-09-20.
//

import Foundation
import CoreData

class SWAPI_Helper{
    static private let urlString = "http://numbersapi.com/";
    
    static let apiResponse = "";
    static var enteredNumber = "0";
    
    static var numbers: [NSManagedObject] = []
    
    static private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    static public func fetchMath(completion handler: @escaping (Data?, Error?) -> Void) {
        let urlStringMath = urlString + enteredNumber + "/math";
        print(#function)
        guard
            let url = URL(string: urlStringMath)
        else{
            preconditionFailure("was not able to convert string to url: \(urlStringMath)")
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) {
            data, response, error in
            
            if let data = data {
                handler(data, error)
            } else if let error = error {
                handler(data, error)
            } else {
                print("something went wrong when fetching the directory: \(String(describing: response))")
            }
        }
        task.resume()
        
    }
	
    static public func fetchDate(completion handler: @escaping (Data?, Error?) -> Void){
        let enteredDate = enteredNumber.split(separator: "/");
        let urlStringDate = urlString + enteredDate[0] + "/" + enteredDate[1] + "/date";
        print(#function)
        guard
            let url = URL(string: urlStringDate)
        else{
            preconditionFailure("was not able to convert string to url: \(urlStringDate)")
        }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) {
            data, response, error in
            
            if let data = data {
                handler(data, error)
            } else if let error = error {
                handler(data, error)
            } else {
                print("something went wrong when fetching the directory: \(String(describing: response))")
            }
        }
        task.resume()
    }
	
    static public func fetchNumber(completion handler: @escaping (Data?, Error?) -> Void){
        let urlStringNumber = urlString + enteredNumber;
        print(#function)
        guard
            let url = URL(string: urlStringNumber)
        else{
            preconditionFailure("was not able to convert string to url: \(urlStringNumber)")
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) {
            data, response, error in
            
            if let data = data {
                handler(data, error)
            } else if let error = error {
                handler(data, error)
            }else {
                print("something went wrong when fetching the directory: \(String(describing: response))")
            }
        }
        task.resume()
        
    }
}
