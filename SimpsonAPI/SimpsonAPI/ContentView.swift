//
//  ContentView.swift
//  SimpsonAPI
//
//  Created by Augustin Diabira on 27/07/2022.
//

import SwiftUI


struct ContentView: View {
    @StateObject var simpson = SimpsonModel()
    @State var onDisplay = false
  
    
    
   
    var body: some View {
        NavigationView {
            VStack {
               
                ScrollView {
                    ForEach(simpson.losSimpson, id:\.self){ losSimpson in
                            SimpsonRow(simpson: losSimpson, simpsonModel: simpson, background: simpson.cardColor(losSimpson.character))
                    }
                   

                }
                
                
           

            } .onAppear {
                simpson.fetchSimpson()
            }.navigationTitle("Simpson Quotes").toolbar {
                Menu {
                    
                        Button {
                           
                        } label: {
                           
                           Text("Quotes liked")
                            
                        }

                        
                    
                

                } label: {
                    Image( systemName: "plus")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView( )
    }
}

func uniqueElementsFrom(array: [Simpson]) -> [Simpson] {
  //Create an empty Set to track unique items
  var set = Set<Simpson>()
  let result = array.filter {
    guard !set.contains($0) else {
      //If the set already contains this object, return false
      //so we skip it
      return false
    }
    //Add this item to the set since it will now be in the array
    set.insert($0)
    //Return true so that filtered array will contain this item.
    return true
  }
  return result
}
