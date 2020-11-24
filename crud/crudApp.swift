//
//  crudApp.swift
//  crud
//
//  Created by User22 on 2020/11/23.
//

import SwiftUI

@main
struct crudApp: App {
    @StateObject var oppoentsData = OppoentsData()
    var body: some Scene {
        WindowGroup {
            TabView{
                ContentView()
                    .tabItem {
                    Image(systemName: "list.bullet")
                    Text("清單")
                    }
                ChartView(oppoentsData: OppoentsData())
                    .tabItem {
                    Image(systemName: "chart.pie.fill")
                    Text("勝率")
                    }
                BarView(oppoentsData:OppoentsData())
                    .tabItem{
                        Image(systemName: "chart.bar.xaxis")
                            
                        Text("位置統計")
                            
                    }
                    
            }.environmentObject(oppoentsData)
            
            
        }
    }
}
