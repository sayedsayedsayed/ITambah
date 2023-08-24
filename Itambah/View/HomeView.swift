//
//  HomeView.swift
//  Itambah
//
//  Created by Vicky Irwanto on 03/04/23.
// 

import SwiftUI

struct HomeView: View {
    
    @StateObject var router = Router()
    
    var body: some View {
        NavigationStack(path: $router.path) {
            ZStack {
                BackgroundView()
                
                VStack(spacing: 0.0){
                    Spacer()
                    HStack {
                        Image("TambahIcon")
                            .resizable()
                            .frame(width: screenWidth * 0.15, height: screenWidth * 0.15)
                        //use scale to fit
                        
                        Text("Tambahin")
                            .font(.system(size: screenWidth * 0.08))
                            .fontWeight(.bold)
                            .fontDesign(.rounded)
                    }
                    .padding()
                    
                    Text("Parents' Friend To Teach Their Kids Math")
                        .font(.headline)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                    
                    Text("by Chuakz Lab Inc.")
                        .font(.title)
                        .fontWeight(.bold)
                        .fontDesign(.rounded)
                        .foregroundColor(Color("SecondColor"))
                        .padding()
                    
                    Button {
                        router.path.append(Destination.instructionView)
                        
                    } label: {
                        Text("Mulai")
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    
                    Spacer()
                }
            }
            .onAppear{
//                SoundManager.instance.PlaySound()
            }
            .navigationDestination(for: Destination.self) { destination in
                ViewFactory.viewForDestination(destination)
            }
        }
        .environmentObject(router)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}

