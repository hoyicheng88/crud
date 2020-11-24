//
//  APPView.swift
//  crud
//
//  Created by User22 on 2020/11/23.
//

import SwiftUI

struct ChartView: View {
    
    @ObservedObject var oppoentsData : OppoentsData
    var percentege : [Double]
    var angle : [Angle]
    var colors:[Color]
    var position = ["請選擇","攔中", "大砲", "舉球", "舉球對角", "自由球員"]
    init(oppoentsData:OppoentsData) {
        self.oppoentsData=oppoentsData
        if oppoentsData.oppoents.count == 0{
            self.percentege=[1.0,1.0]
            self.angle=[.degrees(0),.degrees(0)]
            self.colors=[Color.white,Color.white]
        }
        else{
            percentege=[0,0]
            angle=[Angle]()
            colors=[Color.blue,Color.red]
            var totalwin=0.0
            for oppoent in self.oppoentsData.oppoents{
                if(oppoent.win)
                {
                    totalwin+=1
                }
            }
            percentege[0] = totalwin / Double(oppoentsData.oppoents.count)
            percentege[1] = 1-percentege[0]
            
            var startDegree : Double = 0
            for index in 0...1{
                angle.append(.degrees(startDegree))
                startDegree+=360*percentege[index]
            }
        }
    }
    var body: some View {
        VStack {
            Spacer()
            Spacer()
            Text("勝率")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .multilineTextAlignment(.center)
            Text(String(percentege[0]*100)+"%")
                .font(.subheadline)
            ZStack{
                ForEach(angle.indices) { (index) in
                    if index == angle.count - 1 {
                        MyChart(startAngle: angle[index],
                                endAngle: .zero)
                            .fill(Color.red)
                    } else {
                        MyChart(startAngle: angle[index],
                                endAngle: angle[index+1])
                            .fill(Color.blue)
                    }
                }
            }
            VStack (alignment:.leading){
                HStack(alignment:.center) {
                    Color(.blue)
                        .frame(width: 30, height: 30)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    Text("WIN")
                        .font(.title)
                        .fontWeight(.bold)
                }
                HStack(alignment:.center) {
                    Color(.red)
                        .frame(width: 30, height: 30)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    Text("LOSE")
                        .font(.title)
                        .fontWeight(.bold)
                }
            }
        }
    }
}



struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(oppoentsData: OppoentsData())
    }
}

struct ExtractedView:View{
    var index:Int
    var angle:[Angle]
    var colors:[Color]
    var percentage:[Double]
    var body: some View{
        ZStack{
            
            if index==(angle.count-1){
                //Text(String(percentage[index]))
                MyChart(startAngle: angle[index], endAngle: .degrees(360)/*, percentage:percentage[index]*/ ).fill(colors[index]).onAppear()
            }
        }
    }
}

struct MyChart : Shape{
    var startAngle:Angle
    var endAngle:Angle
    //var percentage :Double
    func path(in rect :CGRect) -> Path {
        Path{(path)in
            let center = CGPoint(x:rect.midX,y:rect.midY)
            path.move(to:center)
            path.addArc(center:center,radius:rect.midX,startAngle: startAngle,endAngle: endAngle,clockwise: false)
        }
    }
    
}
