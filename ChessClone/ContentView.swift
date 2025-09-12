//
//  ContentView.swift
//  ChessClone
//
//  Created by Omer on 11.09.2025.
//

import SwiftUI

extension View {
    func backgroundImage(_ name: String) -> some View {
        self.background(
            Image(name)
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
        )
    }
}
struct ContentView: View {
    var body: some View {
        ZStack{
            
            
            
            // Header
            
            ScrollView{
                VStack(alignment: .leading){
                    // Solve puzzle
                    SolvePuzzlesCard()
                    // Daily puzzle
                    DailyPuzzleCard()
                    // Next lesson
                    NextLessonCard()
                    
                    
                    // game modes
                    ScrollView(.horizontal, showsIndicators: false){
                        GameMode()
                    }
                    .padding(.top, 16)
                    
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 8)
                
                
                
            }
            .frame(maxWidth: .infinity)
            
            VStack{
                Spacer()
                // Play button
                PlayButton()
                    .padding(.horizontal, 16)
                    .padding(.bottom, 8)
                
                //Tabbar
                CustomTabBar()
            }
        }
        .backgroundImage( "wood")
    }
}

struct GameMode: View {
    var body: some View {
        //        ScrollView(.horizontal, showsIndicators: false){
        HStack(){
            VStack(spacing: 8){
                Text("Rapid")
                Image("rapid")
                    .resizable()
                    .frame(width: 50, height: 50)
                Text("822")
            }
            .frame(width: 120, height: 120)
            .padding(1)
            .border(Color.green, width: 1)
            
            VStack(spacing: 8){
                Text("Live960")
                Image(systemName: "clock.fill")
                Text("830")
            }
            .frame(width: 120, height: 120)
            .padding(1)
            .border(Color.green, width: 1)
            
            VStack(spacing: 8){
                Text("Daily")
                Image(systemName: "clock.fill")
                Text("800")
            }
            .frame(width: 120, height: 120)
            .padding(1)
            .border(Color.green, width: 1)
            
            VStack(spacing: 8){
                Text("Bullet")
                Image(systemName: "clock.fill")
                Text("800")
            }
            .frame(width: 120, height: 120)
            .padding(1)
            .border(Color.green, width: 1)
            
            VStack(spacing: 8){
                Text("Daily960")
                Image(systemName: "clock.fill")
                Text("800")
            }
            .frame(width: 120, height: 120)
            .padding(1)
            .border(Color.green, width: 1)
            
            VStack(spacing: 8){
                Text("Puzzles")
                Image(systemName: "clock.fill")
                Text("712")
            }
            .frame(width: 120, height: 120)
            .padding(1)
            .border(Color.green, width: 1)
            
            VStack(spacing: 8){
                Text("Blitz")
                Image(systemName: "clock.fill")
                Text("596")
            }
            .frame(width: 120, height: 120)
            .padding(1)
            .border(Color.green, width: 1)
            
        }
        .frame(height: 150)
        .padding(.horizontal, 0)
        .border(Color.gray, width: 1)
        //        }
    }
}
struct PlayButton: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color(hex: "81B64C"))
            .frame(height: 56)
            .overlay(
                Text("Play")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
            )
    }
}

struct DailyPuzzleCard: View {
    var body: some View {
        HStack(spacing: 12) {
            
            Image("puzzle1")
                .resizable()
                .frame(width: 150, height: 150)
                .padding(.leading)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Daily Puzzle")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                
                HStack(spacing: 6) {
                    Image(systemName: "person.2.fill")
                        .font(.system(size: 12))
                    Text("Solved by 1,378,585")
                        .font(.system(size: 13))
                }
                .foregroundColor(Color.gray)
                
                Spacer()
                
                // Puzzle Icon
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(hex: "81B64C").opacity(0.2))
                    .frame(width: 56, height: 56)
                    .overlay(
                        Image(systemName: "puzzlepiece.fill")
                            .font(.system(size: 28))
                            .foregroundColor(Color(hex: "81B64C"))
                    )
            }
            
            
            
        }
        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
        .background(Color.black.opacity(0.4))
        .padding(.leading, 0)
        
    }
}

struct SolvePuzzlesCard: View {
    var body: some View {
        HStack(spacing: 12) {
            
            Image("puzzle2")
                .resizable()
                .frame(width: 150, height: 150)
                .padding(.leading)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Solve Puzzles")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                
                Text("Continue Your Journey!")
                    .font(.system(size: 14))
                    .foregroundColor(Color.gray)
                
                Spacer()
                
                HStack(spacing: 12) {
                    // Rating Badge
                    ZStack {
                        Image(systemName: "diamond.fill")
                            .font(.system(size: 36))
                            .foregroundColor(Color(hex: "CD7F32"))
                        Text("13")
                            .font(.system(size: 14, weight: .bold))
                            .foregroundColor(.white)
                    }
                    
                    Text("2012")
                        .font(.system(size: 20, weight: .black))
                        .foregroundColor(.white)
                    
                    HStack(spacing: 4) {
                        Image(systemName: "flame.fill")
                            .foregroundColor(Color(hex: "FF6B35"))
                        Text("27")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color(hex: "FF6B35"))
                    }
                }
                
                // Progress Bar
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color.gray.opacity(0.3))
                        .frame(height: 8)
                    
                    RoundedRectangle(cornerRadius: 4)
                        .fill(Color(hex: "FF6B35"))
                        .frame(width: 120, height: 8)
                }
            }
            
            
            
        }
        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
        .background(Color.black.opacity(0.4))
        .padding(.leading, 0)
    }
}

struct NextLessonCard: View {
    var body: some View {
        HStack(spacing: 12) {
            
            Image("standardboard")
                .resizable()
                .frame(width: 150, height: 150)
                .padding(.leading)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Next Lesson")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                
                Text("The Goals Of Chess")
                    .font(.system(size: 14))
                    .foregroundColor(Color.gray)
                
                Spacer()
                
                // Lesson Icon graduationcap.fill
                Image("cap")
                    .resizable()
                    .frame(width: 56, height: 56)
                    .foregroundColor(Color(hex: "4A90E2"))
            }
            .padding(.vertical, 8)
            
            
            
        }
        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
        .background(Color.black.opacity(0.4))
        .padding(.leading, 0)
        
    }
}

struct CustomTabBar: View {
    var body: some View {
        
        HStack(spacing: 0) {
            TabBarItem(icon: Image("greenpawn"), label: "Home", isSelected: false)
            TabBarItem(icon: Image(systemName: "puzzlepiece.extension.fill"), label: "Puzzles", isSelected: false)
            TabBarItem(icon: Image(systemName: "graduationcap.fill" ), label: "Learn", isSelected: false)
            TabBarItem(icon: Image(systemName: "binoculars.fill"), label: "Watch", isSelected: false)
            TabBarItem(icon: Image(systemName: "line.horizontal.3"), label: "More", isSelected: false)
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 8)
        .padding(.bottom, 4)
        .background(Color(hex: "1F1C19"))
    }
}


struct TabBarItem: View {
    let icon: Image
    let label: String
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 4) {
            icon
                .resizable()
                .scaledToFit()
                .frame(width: 22, height: 22)
                .font(.system(size: 22))
                .foregroundColor(isSelected ? Color(hex: "81B64C") : Color.gray)
            
            Text(label)
                .font(.system(size: 10))
                .foregroundColor(isSelected ? Color(hex: "81B64C") : Color.gray)
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ContentView()
}

