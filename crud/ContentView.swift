//
//  ContentView.swift
//  crud
//
//  Created by User22 on 2020/11/23.
//

import SwiftUI

struct ContentView: View {
    //@ObservedObject var oppoentsData=OppoentsData()
    @EnvironmentObject var oppoentsData : OppoentsData
    //@Published var oppoentsData=OppoentsData()
    @State private var showEdit = false
    @State private var selectedIndex = 0
    var body: some View {
        ZStack{
            Color(red: 237/255, green: 232/255, blue: 216/255)
        VStack{
            NavigationView{
                List{
                    ForEach(oppoentsData.oppoents){ (index) in
                        NavigationLink(destination: OppoentEditor(oppoentsData: self.oppoentsData, editOppoent: index)){OppoentRow(oppoent : index)}
                    }.onDelete{(indexSet) in
                        self.oppoentsData.oppoents.remove(atOffsets: indexSet)
                        
                    }.onMove { (indexSet, index) in
                        self.oppoentsData.oppoents.move(fromOffsets: indexSet,
                                        toOffset: index)
                    }
                }//.background(Color.orange)
                .navigationBarTitle("歷史戰績")
                .navigationBarItems(leading: EditButton().foregroundColor(.orange), trailing: Button(action: {self.showEdit = true}, label: {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.orange)
                }))
                .sheet(isPresented: $showEdit){
                    NavigationView{OppoentEditor(oppoentsData: self.oppoentsData)}
                }
            }
        }
            
            

        }
        //.background(Color(red: 237/255, green: 232/255, blue: 216/255))
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
