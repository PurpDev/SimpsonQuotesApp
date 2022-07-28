//
//  SimpsonImage.swift
//  SimpsonAPI
//
//  Created by Augustin Diabira on 27/07/2022.
//

import Foundation
import SwiftUI

struct URLImage: View {
    let urlString: String
    let background:Color
    
    @State var data: Data?
    var body: some View {
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage).resizable().frame(width: 95, height: 175).background(background)
        }else {
            Image(systemName: "questionmark").resizable().aspectRatio( contentMode: .fit).frame(width: 130, height: 70)
                .background(Color.gray)
                .onAppear {
                    fetchData()
                }
        }
    }
    private func fetchData() {
        guard let url = URL(string: urlString) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {data,_,_ in
            self.data = data
        }
        task.resume()
    }
    
}
