//
//  StatusView.swift
//  crud
//
//  Created by User22 on 2020/11/24.
//

import SwiftUI

struct BarView: View {
    @ObservedObject var oppoentsData : OppoentsData
    var Widths:[Double]
    init(oppoentsData:OppoentsData) {
        self.oppoentsData=oppoentsData
        if oppoentsData.oppoents.count == 0{
            self.Widths=[0,0,0,0,0]
        }
        else{
            Widths=[0,0,0,0,0]
            
            for oppoent in self.oppoentsData.oppoents{
                if(oppoent.position == "攔中")
                {
                    Widths[0]+=1
                }
                else if(oppoent.position == "大砲")
                {
                    Widths[1]+=1
                }
                else if(oppoent.position == "舉球")
                {
                    Widths[2]+=1
                }
                else if(oppoent.position == "舉球對角")
                {
                    Widths[3]+=1
                }
                else if(oppoent.position == "自由球員")
                {
                    Widths[4]+=1
                }
            }
        }
    }
    
    var body: some View {
        VStack {
            Text("位置統計")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
            
            HStack(spacing:30){
                Bar(Width:Widths[0])
                Bar(Width:Widths[1])
                Bar(Width:Widths[2])
                Bar(Width:Widths[3])
                Bar(Width:Widths[4])
            }
            HStack(spacing:25){
                Text("攔中")
                Text("大砲")
                Text("舉球")
                Text("舉對")
                Text("自由")
            }
            .foregroundColor(.orange)
        }
        
    }
}

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
        BarView(oppoentsData:OppoentsData())
    }
}
