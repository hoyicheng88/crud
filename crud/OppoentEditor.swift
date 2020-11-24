//
//  OppoentEditor.swift
//  crud
//
//  Created by User22 on 2020/11/23.
//

import SwiftUI

struct OppoentEditor: View {
    var position = ["請選擇","攔中", "大砲", "舉球", "舉球對角", "自由球員"]
    @Environment(\.presentationMode) var preMode
    @State private var selectedIndex=0
    @State private var name = ""
    @State private var date=Date()
    @State private var winscore=0
    @State private var losescore=0
    @State private var win = true
    var disabledForm:Bool{
        name.isEmpty || (selectedIndex==0)
    }
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        return dateFormatter
    }()
    var oppoentsData : OppoentsData
    
    var editOppoent : Oppoent?
    var body: some View {
        Form{
            TextField("對手",text:$name)
            DatePicker("日期", selection:$date,displayedComponents:.date)
            Picker(selection: $selectedIndex, label: Text("位置"), content: /*@START_MENU_TOKEN@*/{
                Text(self.position[0]).tag(0)
                Text(self.position[1]).tag(1)
                Text(self.position[2]).tag(2)
                Text(self.position[3]).tag(3)
                Text(self.position[4]).tag(4)
            }/*@END_MENU_TOKEN@*/)
            Stepper("得分 :\(winscore)",value:$winscore,in:0...35)
            Stepper("失分 :\(losescore)",value:$losescore,in:0...35)
            Toggle("勝負", isOn:$win)
        }.navigationBarTitle(editOppoent == nil ?"新增對戰":"修改對戰")
        .navigationBarItems(trailing: Button("新增"){
            let oppoent = Oppoent(name: self.name, date: self.date, position: self.position[self.selectedIndex], winscore: self.winscore, losescore: self.losescore, win: self.win)
            if let editOppoent = self.editOppoent{
                let index = self.oppoentsData.oppoents.firstIndex{
                    return $0.id == editOppoent.id
                }!
                self.oppoentsData.oppoents[index] = oppoent
            }
            else{
                self.oppoentsData.oppoents.insert(oppoent,at:0)
            }
            self.preMode.wrappedValue.dismiss()
            
        }
        .disabled(disabledForm)
        .foregroundColor(.orange))
        .onAppear{
            if let editOppoent = self.editOppoent{
                self.selectedIndex = self.position.firstIndex(of: editOppoent.position) ?? 0
                self.name = editOppoent.name
                self.date=editOppoent.date
                self.winscore=editOppoent.winscore
                self.losescore=editOppoent.losescore
                self.win=editOppoent.win
            }
        }
    }
}

struct OppoentEditor_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            OppoentEditor(oppoentsData:OppoentsData())
        }
    }
}
