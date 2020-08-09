//
//  FirstScreenUI.swift
//  Recognizer-Chords
//
//  Created by Luciano Schillagi on 5/21/20.
//  Copyright © 2020 Luko. All rights reserved.
//

import SwiftUI
import AVKit

struct FirstScreenUI: View {

    // MARK: Properties 📥
    @State private var buttonDisabled = true // Represents if the button is enabled or not
    @State private var nextPageName: String? = nil // Stores the value which will be the next screen
    @State var audioPlayer: AVAudioPlayer! // Reference to the framework AVAudioPlayer
    @State var lastChordSound: Int // Almacena el valor del último acorde que sonó
    @State var aciertos: Int // Almacena la cantidad de aciertos del usuario
    @State var desaciertos: Int // Almacena la cantidad de desaciertos del usuario
    
    var body: some View {
        NavigationView {
            VStack {
                
                // Score Section
                HStack {
                    VStack {
                        Text("aciertos")
                        Text("\(self.aciertos)").bold().font(.largeTitle)
                        Text("\(self.aciertos)/8")
                    }
                    Spacer().frame(width: 50)
                    VStack {
                        Text("desaciertos")
                        Text("\(self.desaciertos)").bold().font(.largeTitle)
                        Text("\(self.desaciertos)/3")
                    }
                }
                
                // Play Section
                HStack {
                    Button(action: {
                        print("Play Pressed!!!")
                        self.chooseMajorOrMinor()
                        self.buttonDisabled = false
                    }) {
                        Image(systemName: "play.circle")
                            .resizable()
                            .frame(width: 70.0, height: 70.0)
                    }
                        
                    .frame(minWidth: 400, maxWidth: .infinity)
                    .padding()
                    .disabled(!buttonDisabled)
                }
                .frame(width: 200, height: 200, alignment: .center)
                
                // Chords Section
                HStack {
                    Button(action: {
                      print("Major Pressed!!!")
                      self.userChooseMajor()
                      self.buttonDisabled = true
                    }) {
                        Text("Major")
                    }
                    .frame(width: 150, height: 150, alignment: .center)
                    .disabled(buttonDisabled)
                    
                    Button(action: {
                      print("Minor Pressed!!!")
                      self.userChooseMinor()
                      self.buttonDisabled = true
                    }) {
                        Text("Minor")
                    }
                    .frame(width: 150, height: 150, alignment: .center)
                    .disabled(buttonDisabled)
                }
                .frame(width: 500, height: 200, alignment: .center)
                
                // Navigation to Game Over
                NavigationLink(destination: GameOverScreen(),
                               tag: "GameOverScreen",
                               selection: $nextPageName) { EmptyView() }
                  
        
                // Navigation to Second Screen
                NavigationLink(destination: SecondScreenUI(lastChordSound: 0,
                                   aciertos: 0,
                                   desaciertos: 0),
                                tag: "SecondScreenUI",
                                selection: $nextPageName) { EmptyView() }
            }
            
        }.navigationBarBackButtonHidden(true)
        
    }
    
    // MARK: Methods ⚙️
    
    // Task: Choose between Major or Minor Chord Method
    func chooseMajorOrMinor() {
        let randomInt = Int.random(in: 1...2)
        
        switch randomInt {
            case 1:
            chooseBetweenMajorChords()
            case 2:
            chooseBetweenMinorChords()
            default:
            print("Some other number")
        }
    }
    
    // Task: Choose between 3 Major Chords
    func chooseBetweenMajorChords() {
        print("Es un acorde mayor!")

        let randomInt = Int.random(in: 1...3) // dice 🎲
        
        switch randomInt {
            case 1:
            print("Suena el acorde mayor 1")
            self.lastChordSound = 1
            
            
            // TODO: refactor boilerpolate code...
            let majorOne = Bundle.main.path(forResource: "Major_one", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: majorOne!))
            self.audioPlayer.play()
            case 2:
            print("Suena el acorde mayor 2")
            self.lastChordSound = 2
            let majorTwo = Bundle.main.path(forResource: "Major_two", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: majorTwo!))
            self.audioPlayer.play()
            case 3:
            print("Suena el acorde mayor 3")
            self.lastChordSound = 3
            let majorThree = Bundle.main.path(forResource: "Major_one", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: majorThree!))
            self.audioPlayer.play()
            default:
            print("Some other number")
        }
        print(self.lastChordSound)
    }
    
    // Task: Choose between 3 Minor Chords
    func chooseBetweenMinorChords() {
        
        print("Es un acorde menor!")
        
        let randomInt = Int.random(in: 4...6)
        switch randomInt {
            case 4:
            print("Suena el acorde menor 1")
            self.lastChordSound = 4
            let minorOne = Bundle.main.path(forResource: "Major_one", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: minorOne!))
            self.audioPlayer.play()
            case 5:
            print("Suena el acorde menor 2")
            self.lastChordSound = 5
            let minorTwo = Bundle.main.path(forResource: "Major_two", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: minorTwo!))
            self.audioPlayer.play()
            case 6:
            print("Suena el acorde mayor 3")
            self.lastChordSound = 6
            let minorThree = Bundle.main.path(forResource: "Major_one", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: minorThree!))
            self.audioPlayer.play()
            default:
            print("Some other number")
        }
        
        print(self.lastChordSound)
    }
    
    // MARK: User decision methods

    // Task: Si el usuario presiona-elige el botón Major
    // se ejecuta la siguiete lógica
    func userChooseMajor(){
        
      // Escenario si el usuario acierta 😀
      if (1...3).contains(self.lastChordSound) {
          print("ACERTASTE, EL ACORDE QUE SONÓ ES MAYOR")
          self.aciertos += 1
        
          toNextLevel()
        
      // Escenario si el usuario falla 😬
      } else {
          print("NO ACERTASTE, EL ACORDE QUE SONÓ Es menor")
          self.desaciertos += 1
        
          toGameOver()
      }
      
      // Test: results
      print("Cantidad de aciertos \(String(describing: self.aciertos))")
      print("Cantidad de desaciertos \(String(describing: self.desaciertos))")
    }

    // Task: Si el usuario presiona-elige el botón Minor
    // se ejecuta la siguiete lógica
    func userChooseMinor(){
      
      // Escenario si el usuario acierta 😀
      if (4...6).contains(self.lastChordSound) {
          print("ACERTASTE, EL ACORDE QUE SONÓ ES menor")
          self.aciertos += 1
    
        
          toNextLevel()
        
      // Escenario si el usuario falla 😬
      } else {
          print("NO ACERTASTE, EL ACORDE QUE SONÓ Es MAYOR")
          self.desaciertos += 1
        
          toGameOver()
      }
      
      // Results
      print("Cantidad de aciertos \(String(describing: self.aciertos))")
      print("Cantidad de desaciertos \(String(describing: self.desaciertos))")
  }
    
    // Task: Notificar al usuario de que perdió
    func toGameOver() {
        // to Game Over scenario
        if self.desaciertos == 3 {
            print("GAME OVER 😞")
            
            // TODO: cuando el usuario pierde
            // la app navega automáticamente a la pantalla
            // "Game Over"
            self.nextPageName = "GameOverScreen"
            print(self.nextPageName ?? "")
            
            // Reset the score
            self.aciertos = 0
            self.desaciertos = 0
        
        }
    }

    // Task: Notificar al usuario de que pasó a la siguiente pantalla
    func toNextLevel() {
        // to Next Level scenario
        if self.aciertos == 3 { // 8 later
            print("Bien!!! pasaste al siguiente nivel 👏")
            self.nextPageName = "SecondScreenUI"
            print(self.nextPageName ?? "")
            
            // Reset the score
//            self.aciertos = 0
//            self.desaciertos = 0
        }
    }
}

// MARK: Previews
struct FirstScreenUI_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreenUI(lastChordSound: 0, aciertos: 0, desaciertos: 0)
    }
}
