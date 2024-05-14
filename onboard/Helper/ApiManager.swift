//
//  ApiManager.swift
//  onboard
//
//  Created by admin on 07/05/2024.
//

import Alamofire
import ObjectMapper

class APIManager {
    static let shared = APIManager()
    
    private init() {}
    
    func fetchData(from endPoint: String, completion: @escaping (Result<Any, Error>) -> Void) {
        
        
        let parameters: Parameters = [
            "api_key": AppConfig.movieApiKey,
        ]
        AF.request(AppConfig.baseUrl + endPoint, method: .get, parameters: parameters)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    guard let data = value as? [String: Any] else {
                        print("Invalid JSON format")
                        return
                    }
                    if let moviesResponse = Mapper<ArrayResponse<MovieModel>>().map(JSON: data) {
                        completion(.success(moviesResponse.results))
                    }
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}

