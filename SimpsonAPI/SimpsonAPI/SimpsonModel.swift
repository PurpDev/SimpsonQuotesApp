//
//  SimpsonModel.swift
//  SimpsonAPI
//
//  Created by Augustin Diabira on 27/07/2022.
//

import Foundation
import SwiftUI

class SimpsonModel: ObservableObject {
    @Published var losSimpson:[Simpson] = []
    
    func fetchSimpson(){
        // URL
        guard let url = URL(string: "https://thesimpsonsquoteapi.glitch.me/quotes?count=55&character=") else {return}
        
        let dataTask = URLSession.shared.dataTask(with: url) {[weak self] data, _,
            error in
            guard let data = data, error == nil else {
                return
            }
        
        // Decode
            do {
                let losSimpson =  try JSONDecoder().decode([Simpson].self, from: data)
                DispatchQueue.main.async {
                    self?.losSimpson = losSimpson
                }
            } catch  {
                print(error)
            }
        
    }
        dataTask.resume()
    
   
}
    
  
    func cardColor(_ character: String) -> Color {
        switch character {
        case "Homer Simpson": return .pink
        case "Lisa Simpson": return .red
        case "Moe Szyslak": return .gray
        case "Ralph Wiggum": return .indigo
        case "Marge Simpson": return .blue
        case "Bart Simpson": return .orange
        case "Dr. Nick": return .mint
        case "Apu Nahasapeemapetilon": return .green
            
        default: return .cyan
            
        }
    }
}
