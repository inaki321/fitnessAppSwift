//
//  CalorieListView.swift
//  DemoUIApp
//
//

import SwiftUI

struct Position: Identifiable {
    let id: Int
    let name: String
    let boolValue: Bool
}

struct CalorieListView: View {
    
    @binding calco: int
    let positions = [
        Position(id: 1, name: "Pechuga Asada(100g) 164", boolValue: true, calc = 164),
        Position(id: 2, name: "Arroz(100g) 130", boolValue: true, calc = 130),
        Position(id: 3, name: "Frijoles(100g) 347", boolValue: true, calc = 347),
        Position(id: 4, name: "Pescado(100g) 206", boolValue: true, calc = 206),
        Position(id: 5, name: "Pasta (100g) 150", boolValue: false, calc = 150)
    ]
    
    var body: some View {
        List {
            ForEach(positions) { position in
                HStack(alignment: .firstTextBaseline, spacing: 5){
                    Text(position.name)
                    if position.boolValue {
                        Button( action: {
                            
                            $calco += positions[Position].calc
        
                        } label: {
                            Text("+")
                        }
                        .frame(width: 80, height: 40)
                        .padding(5)
                        .buttonStyle(CustomButtonStyle())
                    } else {
                        Button ( action: {
                           $calco =0
                        }
                        } label: {
                            Text("Reset")
                        }
                        .frame(width: 80, height: 40)
                        .padding(5)
                        .buttonStyle(CustomButtonStyle())
                    }
                }
            }
        }
        .listStyle(.plain)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CalorieListView_Previews: PreviewProvider {
    static var previews: some View {
        CalorieListView()
    }
}
