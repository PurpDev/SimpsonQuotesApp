//
//  SimpsonRow.swift
//  SimpsonAPI
//
//  Created by Augustin Diabira on 27/07/2022.
//

import SwiftUI

struct SimpsonRow: View {
    let simpson:Simpson
    let simpsonModel:SimpsonModel
    let background:Color
    var body: some View {
        ZStack {
            
            Rectangle().frame(width: 390, height: 298).foregroundColor(background)
            VStack {
                
                
                HStack {
                    URLImage(urlString: simpson.image, background: simpsonModel.cardColor(simpson.character))
                    Text(simpson.quote).font(.callout).lineLimit(6)
                }
                
            
                
                Text(simpson.character).bold()
            }.padding(.leading)
        }
    }
}


// ZStack {

//Rectangle().frame(width: 390, height: 298).foregroundColor(background)
//VStack {
//
//
//    HStack {
//        Image("homersimpson").resizable().frame(width: 95, height: 175)
//        Text("Facts are meaningless. You could use facts to prove anything that's even remotely true.").font(.callout)
//    }
//
//
//
//    Text("Homer Simspon").bold()
//}
//}
