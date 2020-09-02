//
//  APIProtocol.swift
//  CuvvaCodeTest
//
//  Created by Shyam Bhudia on 31/08/2020.
//  Copyright © 2020 Shyam Bhudia. All rights reserved.
//

import Foundation

enum APIError: Error {
    case requestFailed
    case invalidData
    case invalidUrl
}

protocol APIProtocol {
    // A valid session
    var session: URLSession { get }
    var urlBuilder: URLBuilderProtocol { get }
    
    //Generic fetch api method
    func fetch<T: Decodable>(with url: URL, decode: FetchDecodeCompletion<T>?, completion: FetchCompletion<T>?)
    
    func fetchArray<T: Decodable>(with url: URL, decode: FetchArrayDecodeCompletion<T>?, completion: FetchArrayCompletion<T>?)
}

/**
 Provide default generic implementation
 */
extension APIProtocol {
    
    typealias NetworkCompletion = (Decodable?, APIError?) -> Void
    
    typealias FetchCompletion<T: Decodable> = (Result<T, APIError>) -> Void
    
    typealias FetchDecodeCompletion<T: Decodable> = (Decodable) -> T?
    
    
    typealias NetworkArrayCompletion = ([Decodable]?, APIError?) -> Void
    
    typealias FetchArrayCompletion<T: Decodable> = (Result<[T], APIError>) -> Void
    
    typealias FetchArrayDecodeCompletion<T: Decodable> = ([Decodable]) -> [T]?
    
    /**
     Using Generics to parse the Decodable data from URLSession
     */
    func decodingTask<T: Decodable>(with request: URLRequest,
                                    decodingType: T.Type,
                                    completionHandler completion: @escaping NetworkCompletion) -> URLSessionDataTask {
        
        let task = session.dataTask(with: request) { data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .requestFailed)
                return
            }
            if httpResponse.statusCode == 200 {
                if let data = data {
                    do {
                        let genericModel = try JSONDecoder().decode(decodingType, from: data)
                        completion(genericModel, nil)
                    } catch {
                        print(error.localizedDescription)
                        completion(nil, .invalidData)
                    }
                } else {
                    completion(nil, .invalidData)
                }
            } else {
                completion(nil, .requestFailed)
            }
        }
        return task
    }
    
    /**
     Creates decoding task using url session, then passing it back to the completion
     */
    public func fetch<T: Decodable>(with url: URL,
                             decode: FetchDecodeCompletion<T>?,
                             completion: FetchCompletion<T>?) {
        let request = URLRequest(url: url)
        
        let task = decodingTask(with: request, decodingType: T.self) { (json , error) in
            
            // change to main queue
            DispatchQueue.main.async {
                guard let json = json else {
                    if let error = error {
                        completion?(Result.failure(error))
                    } else {
                        completion?(Result.failure(.invalidData))
                    }
                    return
                }
                if let value = decode?(json) {
                    completion?(.success(value))
                } else {
                    completion?(.failure(.invalidData))
                }
            }
        }
        task.resume()
    }
    
    
    
    
    /**
     Using Generics to parse the Decodable data from URLSession
     */
    func arrayDecodingTask<T: Decodable>(with request: URLRequest,
                                         decodingType: T.Type,
                                         completionHandler completion: @escaping NetworkArrayCompletion) -> URLSessionDataTask {
        
        let task = session.dataTask(with: request) { data, response, error in
            
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .requestFailed)
                return
            }
            if httpResponse.statusCode == 200 {
                if let data = data {
                    do {
                        let jsonDecoder = JSONDecoder()
                        jsonDecoder.dateDecodingStrategy = .formatted(DateFormatter.iso8601Full)
                        let genericModel = try jsonDecoder.decode([T].self, from: data)
                        completion(genericModel, nil)
                    } catch (let error) {
                        print(error)
                        completion(nil, .invalidData)
                    }
                } else {
                    completion(nil, .invalidData)
                }
            } else {
                completion(nil, .requestFailed)
            }
        }
        return task
    }
    /**
        Creates decoding task using url session, then passing it back to the completion
        */
       public func fetchArray<T: Decodable>(with url: URL,
                                decode: FetchArrayDecodeCompletion<T>?,
                                completion: FetchArrayCompletion<T>?) {
           let request = URLRequest(url: url)
           
        let task = arrayDecodingTask(with: request, decodingType: T.self) { (json , error) in
               
               // change to main queue
               DispatchQueue.main.async {
                   guard let json = json else {
                       if let error = error {
                           completion?(Result.failure(error))
                       } else {
                           completion?(Result.failure(.invalidData))
                       }
                       return
                   }
            
                   if let value = decode?(json) {
                       completion?(.success(value))
                   } else {
                       completion?(.failure(.invalidData))
                   }
               }
           }
           task.resume()
       }
       
       
}
