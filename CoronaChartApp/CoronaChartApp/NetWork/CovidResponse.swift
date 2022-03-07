//
//  CovidOverView.swift
//  CoronaChartApp
//
//  Created by 유준용 on 2022/03/07.
//

import Foundation


struct CovidOverView: Codable {
    let API: APIResponse
    let korea: CovidInCity
    let seoul: CovidInCity
    let busan: CovidInCity
    let daegu: CovidInCity
    let incheon: CovidInCity
    let gwangju: CovidInCity
    let daejeon: CovidInCity
    let ulsan: CovidInCity
    let sejong: CovidInCity
    let gyeonggi: CovidInCity
    let gangwon: CovidInCity
    let chungbuk: CovidInCity
    let chungnam: CovidInCity
    let jeonbuk: CovidInCity
    let jeonnam: CovidInCity
    let gyeongbuk: CovidInCity
    let gyeongnam: CovidInCity
    let jeju: CovidInCity
    let quarantine: CovidInCity
}

struct APIResponse: Codable {
    let updateTime: String
    let resultCode: String
}

struct CovidInCity: Codable{
    let countryNm: String
    let totalCnt: Int
    let recCnt: Int
    let deathCnt: Int
    let isolCnt: Int
    let qurRate: Int
    let incDec: Int
    let incDecK: Int
    let incDecF: Int
}




//GET /korea/beta/?serviceKey={API_KEY}
//Host: api.corona-19.kr
// Response 링크 : https://github.com/dhlife09/Corona-19-API/blob/master/sample/response/SAMPLE_vBETA.json
// Parameter 설명 링크 : https://github.com/dhlife09/Corona-19-API/blob/master/API_DOC_vBETA.md

/*
"korea": {
    "countryNm": "합계", (시,도명)
    "totalCnt": 409099,(코로나 19 전체 확진자 수)
    "recCnt": 368723, (코로나 19 완치자 수)
    "deathCnt": 3215, (코로나 19 사망자 수)
    "isolCnt": 37161, (코로나 19 치료중인 확진자 수)
    "qurRate": 789, (코로나19 발생률)
    "incDec": 3034,(전일대비 확진)
    "incDecK": 3011,(전일대비 확진-지역)
    "incDecF": 23 (전일대비 확진-해외)
}
*/
