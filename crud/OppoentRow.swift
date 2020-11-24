//
//  OppoentRow.swift
//  crud
//
//  Created by User22 on 2020/11/23.
//

import SwiftUI

struct OppoentRow: View {
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        return dateFormatter
    }()
    var oppoent:Oppoent
    var position = ["攔中", "大砲", "舉球", "舉球對角", "自由球員"]
    var body: some View {
        HStack{
            Image(systemName: oppoent.win ? "rosette":"multiply.circle.fill")
            if(oppoent.win)
            {
                Text("\(oppoent.name)")
                    .font(.largeTitle)
                    
            }
            else{
                Text("\(oppoent.name)")
                    .font(.largeTitle)
                    .foregroundColor(.red)
            }
            Spacer()
        }//.background(Color.orange)
    }
}

struct OppoentRow_Previews: PreviewProvider {
    static var previews: some View {
        OppoentRow(oppoent:Oppoent(name:"aaa", date:Date(), position:"大砲", winscore:12, losescore:10, win:true))
    }
}


