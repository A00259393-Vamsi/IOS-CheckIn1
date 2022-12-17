//
//  SWAPI_Helper.swift
//  swapi
//
//  Created by Cambrian on 2022-09-20.
//

import Foundation

class SWAPI_Helper{
    static private let urlString = "http://numbersapi.com/";
    
    static let apiResponse = "";
	
    static private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    static public func fetchMath(enteredNumber: String) -> String {
        let urlStringMath = urlString + enteredNumber + "/math";
        print(#function)
        guard
            let url = URL(string: urlStringMath)
        else{
            preconditionFailure("was not able to convert string to url: \(urlStringMath)")
        }
        
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            data, response, error in
            
            if let data = data {
                do{
                    let jsonData = try JSONSerialization.jsonObject(with: data)
                    
                    print(jsonData)
                }catch let err{
                    print("\(err)")
                }
            } else if let error = error {
                print("error with data task, fetchMath: \(error)")
            } else {
                print("something went wrong when fetching the directory: \(String(describing: response))")
            }
        }
        task.resume()
        
        return apiResponse;
    }
	
    static public func fetchDate(enteredNumber: String) -> String{
        let enteredDate = enteredNumber.split(separator: "/");
        let urlStringDate = urlString + enteredDate[0] + "/" + enteredDate[1] + "/date";
        print(#function)
        guard
            let url = URL(string: urlStringDate)
        else{
            preconditionFailure("was not able to convert string to url: \(urlStringDate)")
        }
        
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            data, response, error in
            
            if let data = data {
                do{
                    let jsonData = try JSONSerialization.jsonObject(with: data)
                    
                    print(jsonData)
                }catch let err{
                    print("\(err)")
                }
            } else if let error = error {
                print("error with data task, fetchDate: \(error)")
            } else {
                print("something went wrong when fetching the directory: \(String(describing: response))")
            }
        }
        task.resume()
        
        return apiResponse
    }
	
    static public func fetchNumber(enteredNumber: String) -> String{
        let urlStringNumber = urlString + enteredNumber;
        print(#function)
        guard
            let url = URL(string: urlStringNumber)
        else{
            preconditionFailure("was not able to convert string to url: \(urlStringNumber)")
        }
        
        let request = URLRequest(url: url)
        let task = session.dataTask(with: request) {
            data, response, error in
            
            if let data = data {
                do{
                    let jsonData = try JSONSerialization.jsonObject(with: data)
                    
                    print(jsonData)
                }catch let err{
                    print("\(err)")
                }
            } else if let error = error {
                print("error with data task, fetchNumber: \(error)")
            } else {
                print("something went wrong when fetching the directory: \(String(describing: response))")
            }
        }
        task.resume()
        
        return apiResponse
    }
}
