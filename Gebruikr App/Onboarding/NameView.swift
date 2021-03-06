//
//  NameView.swift
//  Gebruikr gegevens
//
//  Created by Thijs Govers on 22/04/2020.
//  Copyright © 2020 Thijs Govers. All rights reserved.
//

import SwiftUI

struct NameView: View {
    @EnvironmentObject var userData: UserData
    @State var showNameExplanation = false
    
    @Binding public var step: Int
    
    private var nextButton: some View {
        NavigationLink(destination: GenderView(step: $step)){
            Text("Volgende").foregroundColor(Color.white).padding(12).background(Capsule().fill(Color.backgroundColor))
        }
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack{
                VStack{
                    Text("Hi! Ik ben Gebruikr.").font(.title)
                    Text("Mag ik jouw naam?").font(.title)
                }
                Button(action: {
                    self.showNameExplanation = true
                }) {
                    Image ("Info").resizable()
                        .frame(width: 30, height: 30, alignment: .center).padding(.bottom, 50)
                }.buttonStyle(PlainButtonStyle()).transition(AnyTransition.opacity.combined(with: .move(edge: .bottom)))
                    
                    .sheet(isPresented: $showNameExplanation) {
                        
                        NameExplanationView()
                        
                }
            }.padding(.bottom)
            
            TextField("Nickname...", text: $userData.username).padding().textFieldStyle(RoundedBorderTextFieldStyle()).shadow(radius: 2)
            Spacer()
            nextButton
            HStack{
                Circle()
                    .fill(Color.backgroundColor)
                    .frame(width: 16, height: 16)
                Circle()
                    .fill(Color.gray)
                    .frame(width: 16, height: 16)
                Circle()
                    .fill(Color.gray)
                    .frame(width: 16, height: 16)
            }
        }.padding()
            .navigationBarTitle("").navigationBarBackButtonHidden(true).foregroundColor(Color("TextColor"))
    }
}

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView(step: .constant(3)).environmentObject(UserData())
    }
}


