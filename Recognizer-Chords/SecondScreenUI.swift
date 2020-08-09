//
//  SecondScreenUI.swift
//  Recognizer-Chords
//
//  Created by Luciano Schillagi on 5/23/20.
//  Copyright © 2020 Luko. All rights reserved.
//

import SwiftUI
import AVKit

// Abstract: ...
struct SecondScreenUI: View {

    // MARK: Properties 📥
    @State private var buttonDisabled = true // Represents if the button is enabled or not
    @State private var nextPageName: String? = nil // Stores the value which will be the next screen
    @State var audioPlayer: AVAudioPlayer! // Reference to the framework AVAudioPlayer
    @State var lastChordSound: Int // Almacena el valor del último acorde que sonó
    @State var aciertos: Int // Almacena la cantidad de aciertos del usuario
    @State var desaciertos: Int  // Almacena la cantidad de desaciertos del usuario
    
    var body: some View {
        
            VStack {
                
                // Score Section
                HStack {
                    VStack {
                        Text("aciertos")
                        Text("\(self.aciertos)").bold()
                        Text("\(self.aciertos)/8")
                    }.background(Color.red)
                    
                    VStack {
                        Text("desaciertos")
                        Text("\(self.desaciertos)").bold()
                        Text("\(self.desaciertos)/3")
                    }.background(Color.blue)
                }
                .frame(width: 500, height: 200, alignment: .center)
                .background(Color.yellow)
                
                // Play Section
                HStack {
                    Button(action: {
                        print("Play Pressed!!!")
                        self.chooseBetweenMmdA()
                        self.buttonDisabled = false
                    }) {
                        Text("Play")
                    }
                    .background(Color.red)
                    .frame(width: 200, height: 200, alignment: .center)
                    .disabled(!buttonDisabled)
                }
                .frame(width: 500, height: 200, alignment: .center)
                .background(Color.orange)
                
                // Chords Section
                HStack {
                    
                    Button(action: {
                      print("Major Pressed!!!")
                      self.userChooseMajor()
                      self.buttonDisabled = true
                    }) {
                        Text("Major")
                    }
                    .background(Color.green)
                    .frame(width: 50, height: 150, alignment: .center)
                    .disabled(buttonDisabled)
                    
                    Button(action: {
                      print("Minor Pressed!!!")
                      self.userChooseMinor()
                      self.buttonDisabled = true
                    }) {
                        Text("Minor")
                    }
                    .background(Color.red)
                    .frame(width: 50, height: 150, alignment: .center)
                    .disabled(buttonDisabled)
                    
                    Button(action: {
                      print("Augmented Pressed!!!")
                      self.userChooseMinor()
                      self.buttonDisabled = true
                    }) {
                        Text("Augmented")
                    }
                    .background(Color.blue)
                    .frame(width: 50, height: 150, alignment: .center)
                    .disabled(buttonDisabled)
                    
                    Button(action: {
                      print("Diminished Pressed!!!")
                      self.userChooseMinor()
                      self.buttonDisabled = true
                    }) {
                        Text("Diminished")
                    }
                    .background(Color.orange)
                    .frame(width: 50, height: 150, alignment: .center)
                    .disabled(buttonDisabled)
                    
                }
                .frame(width: 500, height: 200, alignment: .center)
                .background(Color.yellow)
                
                // Navigation to Game Over
                NavigationLink(destination: GameOverScreen(),
                               tag: "GameOverScreen",
                               selection: $nextPageName) { EmptyView() }
                
                // Navigation to Winner Screen
                NavigationLink(destination: WinnerScreenUI(),
                                tag: "WinnerScreenUI",
                                selection: $nextPageName) { EmptyView() }
                
                
                
                
                
            }.navigationBarBackButtonHidden(true)
    }
    
    // MARK: Methods ⚙️
    // Task: Choose between Major, Minor, Diminished or Augmented Chord Type
    func chooseBetweenMmdA() {
        let randomTypeOfChord = Int.random(in: 1...4) // dice 🎲
        
        switch randomTypeOfChord {
            case 1:
            chooseBetweenMajorChords()
            case 2:
            chooseBetweenMinorChords()
            case 3:
            chooseBetweenDiminishedChords()
            case 4:
            chooseBetweenAugmentedChords()
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
            print("Suena el acorde menor 3")
            self.lastChordSound = 6
            let minorThree = Bundle.main.path(forResource: "Major_one", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: minorThree!))
            self.audioPlayer.play()
            default:
            print("Some other number")
        }
        
        print(self.lastChordSound)
    }
    
    // Task: Choose between 3 Diminished Chords
    func chooseBetweenDiminishedChords() {
        
        print("Es un acorde disminuído!")
        
        let randomInt = Int.random(in: 7...9)
        switch randomInt {
            case 7:
            print("Suena el acorde disminuido 7")
            self.lastChordSound = 4
            let minorOne = Bundle.main.path(forResource: "Major_one", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: minorOne!))
            self.audioPlayer.play()
            case 8:
            print("Suena el acorde disminuido 8")
            self.lastChordSound = 5
            let minorTwo = Bundle.main.path(forResource: "Major_two", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: minorTwo!))
            self.audioPlayer.play()
            case 9:
            print("Suena el acorde disminuido 9")
            self.lastChordSound = 6
            let minorThree = Bundle.main.path(forResource: "Major_one", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: minorThree!))
            self.audioPlayer.play()
            default:
            print("Some other number")
        }
        
        print(self.lastChordSound)
    }

    // Task: Choose between 3 Augmented Chords
    func chooseBetweenAugmentedChords() {
        
        print("Es un acorde aumentado!")
        
        let randomInt = Int.random(in: 10...12)
        switch randomInt {
            case 10:
            print("Suena el acorde aumentado 10")
            self.lastChordSound = 4
            let minorOne = Bundle.main.path(forResource: "Major_one", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: minorOne!))
            self.audioPlayer.play()
            case 11:
            print("Suena el acorde aumentado 11")
            self.lastChordSound = 5
            let minorTwo = Bundle.main.path(forResource: "Major_two", ofType: "mp3")
            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: minorTwo!))
            self.audioPlayer.play()
            case 12:
            print("Suena el acorde aumentado 12")
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

    // Task: Si el usuario presiona-elige el botón Major se ejecuta la siguiete lógica
    func userChooseMajor(){
        
      // Escenario si el usuario acierta 😀
      if (1...3).contains(self.lastChordSound) {
          print("ACERTASTE, EL ACORDE QUE SONÓ ES MAYOR")
          self.aciertos += 1
          toWinnerScreen()
        
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

    // Task: Si el usuario presiona-elige el botón Minor se ejecuta la siguiete lógica
    func userChooseMinor(){
      
      // Escenario si el usuario acierta 😀
      if (4...6).contains(self.lastChordSound) {
          print("ACERTASTE, EL ACORDE QUE SONÓ ES menor")
          self.aciertos += 1
          toWinnerScreen()
        
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
    func toWinnerScreen() {
        // to Game Over scenario
        if self.aciertos == 3 { // 8 later
            print("Bien!!! pasaste al siguiente nivel 👏")
            self.nextPageName = "WinnerScreenUI"
        }
    }
}

// MARK: Previews 📲
struct SecondScreenUI_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreenUI(lastChordSound: 0, aciertos: 0, desaciertos: 0)
    }
}
