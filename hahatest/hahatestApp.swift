//
//  hahatestApp.swift
//  hahatest
//
//  Created by Xurui Mei on 21/9/24.
//







import SwiftUI
import Firebase


@main
struct hahatestApp: App {
    
    init(){
        FirebaseApp.configure()
        print("Confingured firebase")
    }
    var body: some Scene {
        WindowGroup {
            RootView()
                
            }
        }
    }
    
    
    
    
    
    
    

