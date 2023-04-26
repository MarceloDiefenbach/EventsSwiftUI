//
//  SucessView.swift
//  Events
//
//  Created by Marcelo Diefenbach on 24/04/23.
//

import Foundation
import SwiftUI

struct InterestsView: View {
    
    @StateObject var viewModel = LoginAndAccountViewModel()
    
    @State var eventTypes: [EventType] = [
        EventType(title: "Pop", variant: .selected),
        EventType(title: "Rock", variant: .unselected),
        EventType(title: "Funk", variant: .unselected),
        EventType(title: "MPB", variant: .unselected),
        EventType(title: "Festival", variant: .unselected),
        EventType(title: "Food", variant: .unselected),
        EventType(title: "Vegan", variant: .unselected),
        EventType(title: "Others", variant: .unselected),
    ]
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                
                Text("Choose your favorite events styles")
                    .font(Font.DesignSystem.bigTitleBold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.DesignSystem.black)
                    .padding(.bottom, 8)
                Text("We will suggest events based on what you like")
                    .font(Font.DesignSystem.normalRegular)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.DesignSystem.gray)
                    .padding(.bottom, 40)
                    .padding(.horizontal, UIScreen.main.bounds.width*0.04)
                
                EventTypeGrid(eventTypes: $eventTypes)
                
                Spacer()
                
                EVButton(title: "Go to events", iconSFSymbols: "", style: .secondary, action: {
                    viewModel.currentPage = .login
                })
                
            }.padding(.horizontal)
        }
        .onChange(of: eventTypes) { newArray in
            print("Array modificado: \(newArray)")
        }
    }
}


struct InterestsView_Previews: PreviewProvider {
    static var previews: some View {
        InterestsView()
    }
}

enum EventTypeCardVariant {
    case selected, unselected
}

struct EventTypeCard: View {
    
    @Binding var eventTypeCard: EventType
    
    var body: some View {
        ZStack {
            Text(eventTypeCard.title)
                .font(eventTypeCard.variant == .unselected ? Font.DesignSystem.normalRegular : Font.DesignSystem.normalBold)
                .foregroundColor(eventTypeCard.variant == .unselected ? Color.DesignSystem.black : Color.DesignSystem.white)
                .frame(height: UIScreen.main.bounds.height*0.1)
                .frame(maxWidth: .infinity)
                .background(eventTypeCard.variant == .unselected ? Color.black.opacity(0.1) : Color.DesignSystem.primary)
                .onTapGesture(){
                    if eventTypeCard.variant == .selected {
                        eventTypeCard.variant = .unselected
                    } else {
                        eventTypeCard.variant = .selected
                    }
                }
        }.clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

struct EventTypeGrid: View {
    
    @Binding var eventTypes: [EventType]
    
    var body: some View {
        VStack {
            ForEach(0..<Int(eventTypes.count) / 2) { rowIndex in
                HStack {
                    EventTypeCard(eventTypeCard: $eventTypes[rowIndex * 2])
                    EventTypeCard(eventTypeCard: $eventTypes[rowIndex * 2 + 1])
                }
            }
        }
    }
}
