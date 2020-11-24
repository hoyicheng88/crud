//
//  Data.swift
//  crud
//
//  Created by User22 on 2020/11/23.
//

import Foundation
import SwiftUI

struct Oppoent:Identifiable, Codable{
    var id = UUID()
    var name:String
    var date:Date
    var position:String
    var winscore:Int
    var losescore:Int
    var win:Bool
}

class OppoentsData: ObservableObject {
    @AppStorage("oppoents") var oppoentsData: Data?
    init(){
        if let oppoentsData = oppoentsData{
            let decoder = JSONDecoder()
            if let decodedData = try? decoder.decode([Oppoent].self, from: oppoentsData){
                oppoents = decodedData
            }
        }
    }
    @Published var oppoents = [Oppoent](){
        didSet{
            let encoder = JSONEncoder()
            do{
                let data = try encoder.encode(oppoents)
                oppoentsData = data
            } catch{
            }
        }
    }
    var number = 0
}
