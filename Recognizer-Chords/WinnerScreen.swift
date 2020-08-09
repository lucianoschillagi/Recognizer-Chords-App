//
//  WinnerScreen.swift
//  Recognizer-Chords
//
//  Created by Luciano Schillagi on 5/13/20.
//  Copyright © 2020 Luko. All rights reserved.
//

import SwiftUI

struct WinnerScreen: View {
    
    // MARK: Properties 📥
    
    // Stores the value which will be the next screen
    @State private var nextPageName: String? = nil
    
    var body: some View {
        VStack{
            Text("You Win!!!")
            
            // Start the game again button
            Button(action: {
            
            // TODO: crear un método para que cuando
            // el usuario toque el botón la app
            // navegue hacia la pantalla inicial
            // con el score reseteado a 0
                self.toStartAgain()
            
            }) {
                  Text("Start the game again")
                }
            
            // Navigation to First Screen (start the game again)
            NavigationLink(destination: FirstScreenUI(lastChordSound: 0, aciertos: 0, desaciertos: 0),
                             tag: "FirstScreen",
                             selection: $nextPageName) { EmptyView() }
            
        }.navigationBarBackButtonHidden(true)
       
    }
    
    // MARK: Methods
    
    // Task: Llevar a usuario a la pantalla inicial, reinicia el juego
    func toStartAgain() {
        self.nextPageName = "FirstScreen"
    }
}

struct WinnerScreen_Previews: PreviewProvider {
    static var previews: some View {
        WinnerScreen()
    }
}
