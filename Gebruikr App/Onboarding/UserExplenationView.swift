//
//  ContentView.swift
//  LandingPage
//
//  Created by Reamon Hoefakker on 13/05/2020.
//  Copyright © 2020 Reamon Hoefakker. All rights reserved.
//

import SwiftUI

struct UserExplanationView: View {
    @Binding public var step: Int
    @EnvironmentObject var timerData : TimerData
    
    
    private var nextButton: some View {
        NavigationLink(destination: NameView(step: $step)){
            Text("Volgende").foregroundColor(Color.white).padding(12).background(Capsule().fill(Color.backgroundColor))
        }
    }
    
    var body: some View {
        
        VStack {
            VStack(alignment: .leading) {
                if timerData.timeCount > 16 {
                    Text("Oh,")
                        .font(.largeTitle).transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                }
                if timerData.timeCount > 17 {
                    Text("En no worries.")
                        .font(.title).transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                }
                Spacer ()
                    .frame(height: 20)
                if timerData.timeCount > 18 {
                    Text("Gebruikr.  deelt niets.").transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                        .font(.title)
                }
                if timerData.timeCount > 19 {
                    Text("Niks, nada, noppes.").transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                        .font(.title)
                }
                Spacer ()
                    .frame(height: 50)
                if timerData.timeCount > 20 {
                    Text("Alle informatie die je deelt blijft van jou, en jou alleen!").transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                        .font(.title)
                }
            }
            Spacer()
            if timerData.timeCount > 21 {
                VStack{
                    Text("Let's Go!")
                        .font(.title)
                    NavigationLink(destination: NameView(step: $step)){
                        Image("GebruikrIcon")
                            .frame(width: 90, height: 90)
                    }.buttonStyle(PlainButtonStyle())
                    
                }.transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
            }
        }.animation(.default).frame(width: 350, height: 600, alignment: .topLeading)
            .navigationBarTitle("").navigationBarBackButtonHidden(true).foregroundColor(Color("TextColor"))
    }
}

struct UserExplanationView_Previews: PreviewProvider {
    static var previews: some View {
        UserExplanationView(step: .constant(2))
    }
}	
