//
//  HomeView.swift
//  Events
//
//  Created by Marcelo Diefenbach on 25/04/23.
//

import Foundation
import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Nohemi-Bold", size: 34)!]
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    List(viewModel.events) { event in
                        EventPoster(event: event)
                            .onAppear(){
                                print(event.title)
                            }
                    }
                }
            }
            .navigationBarTitle(Text("Events").font(.subheadline), displayMode: .large)
            .onAppear(){
                viewModel.getEvents(completion: { result in
                    if result == true {
                        print("sucesso")
                        print(viewModel.events.count)
                    } else {
                        print("erro")
                    }
                })
            }

        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct EventPoster: View {
    
    @State var event: Event
    
    var body: some View {
        VStack {
            HStack {
                Circle()
                    .foregroundColor(.DesignSystem.primary)
                    .frame(width: 30)
                Text(event.title)
                    .font(.DesignSystem.normalRegular)
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 8)
            .padding(.top, 8)
            
            ZStack {
                Image(event.coverImage)
                    .resizable()
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button("Buy tickets", action: {
                            
                        })
                        .buttonStyle(.borderedProminent)
                        .padding(.trailing, 16)
                        .padding(.bottom, 16)
                    }
                }
            }
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width*1.3)
            
            HStack {
                Text(event.description)
                    .lineSpacing(5.0)
                    .multilineTextAlignment(.leading)
                    .font(.DesignSystem.normalRegular)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 8)
                Spacer()
            }
        }
    }
}
