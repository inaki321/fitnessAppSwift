//
//  DashboardView.swift
//  DemoUIApp
//
//

import SwiftUI

struct DashboardView: View {
	
	@State private var selection: String? = nil
    
    var body: some View {
		NavigationView{
            ZStack(alignment: .top) {
                VStack (alignment: .leading, spacing: 20){
                    NavigationLink(destination: ProfileView(), tag: "A", selection: $selection) { EmptyView() }
                    NavigationLink(destination: CalorieCountView(), tag: "B", selection: $selection) { EmptyView() }
                    NavigationLink(destination: IMCView(), tag: "C", selection: $selection) { EmptyView() }
                    Button {
                        selection = "A"
                    } label: {
                        Text("Perfil")
                    }
                    .buttonStyle(CustomButtonStyle())
                    Button {
                        selection = "B"
                    } label: {
                        Text("Cuenta de calorías")
                    }
                    .buttonStyle(CustomButtonStyle())
                    Button {
                        selection = "C"
                    } label: {
                        Text("IMC")
                    }
                    .buttonStyle(CustomButtonStyle())
                    // .padding([.leading, .trailing], 20)
                    Spacer()
                }
                .padding([.leading, .trailing], 20)
                //.padding()
               
            }
            
		}
        .navigationBarHidden(true)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
