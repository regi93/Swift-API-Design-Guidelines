//
//  CovidDataManager.swift
//  CoronaChartApp
//
//  Created by 유준용 on 2022/03/07.
//

import Alamofire

class CovidDataManager {
    
    func fetchCovidInfo(delegate: DashBoardVC){
        let apiKey = "hsLy1rkDoaAeF4b9UBZlJCcW5IQXT7tOz"
        let url = "https://api.corona-19.kr/korea/beta/?serviceKey=\(apiKey)"
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
            .validate()
            .responseDecodable(of: CovidOverView.self) {response in
                switch response.result {
                    case .success(let data):
//                        print(data)
                        delegate.successFetchCovidInfo(response: data)
                    case .failure(let error):
                        print("Error: \(error)")
                        delegate.failFetchCovidInfo()
                }
            }
    }
}
