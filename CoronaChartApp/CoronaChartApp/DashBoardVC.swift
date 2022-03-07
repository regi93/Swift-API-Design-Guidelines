//
//  DashBoardVC.swift
//  CoronaChartApp
//
//  Created by 유준용 on 2022/03/07.
//

import UIKit
import Charts

class DashBoardVC: UIViewController, ChartViewDelegate {

    lazy var dataManager = CovidDataManager()
    var covidOverviewList: [CovidInCity]? = nil
    let chartView: PieChartView = {
        let view = PieChartView()
        view.backgroundColor = .lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCovidInfo()
        configurePieChartView()
    }

    private func fetchCovidInfo(){
        dataManager.fetchCovidInfo(delegate: self)
    }
    
    private func configurePieChartData(){
        
        let entries = covidOverviewList?.compactMap { [weak self] overview -> PieChartDataEntry? in
          return PieChartDataEntry(
            value: Double(overview.incDec),
            label: overview.countryNm,
            data: overview
          )
        }
        print(entries)
        let dataSet = PieChartDataSet(entries: entries, label: "코로나 발생 현황")
        dataSet.sliceSpace = 1
        dataSet.entryLabelColor = .black
        dataSet.xValuePosition = .outsideSlice
        dataSet.valueTextColor = .black
        dataSet.valueLinePart1OffsetPercentage = 0.8
        dataSet.valueLinePart1Length = 0.2
        dataSet.valueLinePart2Length = 0.3

        dataSet.colors = ChartColorTemplates.vordiplom()
          + ChartColorTemplates.joyful()
          + ChartColorTemplates.colorful()
          + ChartColorTemplates.liberty()
          + ChartColorTemplates.pastel()
          + ChartColorTemplates.material()

        self.chartView.data = PieChartData(dataSet: dataSet)
        self.chartView.spin(duration: 0.3, fromAngle: chartView.rotationAngle, toAngle: chartView.rotationAngle + 80)
    }
    private func configurePieChartView(){
        chartView.delegate = self
        view.addSubview(chartView)
        NSLayoutConstraint.activate([
            chartView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            chartView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            chartView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            chartView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200)
        ])
    }
    var response: CovidOverView? = nil


}


extension DashBoardVC{
    func failFetchCovidInfo(){
        
    }
    func successFetchCovidInfo(response: CovidOverView){
        self.response = response
        self.covidOverviewList = makeCovidOverviewList()
        configurePieChartData()

    }
    
    func makeCovidOverviewList() -> [CovidInCity] {
      return [
        response!.seoul,
        response!.busan,
        response!.daegu,
        response!.incheon,
      ]
    }
}
