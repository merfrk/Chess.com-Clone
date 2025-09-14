//
//  ContentView.swift
//  ChessClone
//
//  Created by Omer on 11.09.2025.
//
import UIKit
import SwiftUI

struct VisualEffectBlur: UIViewRepresentable {
    var blurStyle: UIBlurEffect.Style

    func makeUIView(context: Context) -> UIVisualEffectView {
        UIVisualEffectView(effect: UIBlurEffect(style: blurStyle))
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8 * 17), (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

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
struct AdjustableBlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style
    var intensity: CGFloat // 0.0 - 1.0

    func makeUIView(context: Context) -> UIVisualEffectView {
        let blurEffect = UIBlurEffect(style: style)
        let effectView = UIVisualEffectView(effect: nil)
        
        // UIVisualEffectView üzerinde animasyonla intensity uygulayacağız
        DispatchQueue.main.async {
            effectView.effect = blurEffect
            effectView.alpha = intensity
        }
        
        return effectView
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.alpha = intensity
    }
}

struct ContentView: View {
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithTransparentBackground() // veya .transparentBackground()
        appearance.backgroundColor = UIColor.black.withAlphaComponent(0.3) // İstediğin renk
        appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterialDark)
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    var body: some View {
        
        NavigationStack{
            ZStack{
                ScrollView{
                    VStack(spacing: 16){
                        
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
                        
                        Color.clear.frame(height: 140)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top)
                }
                .background(Color.gray.opacity(0.1))
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading){
                        HStack(spacing: 20) {
                            Image("pawn")
                                .resizable()
                                .frame(width: 22, height: 22)
                            Image("thropy")
                                .resizable()
                                .frame(width: 22, height: 22)
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        Image("chesslogo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 22)
                    }
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Image("friends")
                            .resizable()
                            .frame(width: 22, height: 22)
                    }
                }
                .navigationBarTitleDisplayMode(.inline)
                VStack{
                    
                    Spacer()
                    // Play button
                    VStack{
                        PlayButton()
                            .padding(.horizontal, 16)
                            .padding(.bottom, 8)
                        
                        //Tabbar
                        CustomTabBar()
                    }
                    .background(
                        ZStack {
                                // Blur ve siyah arka plan katmanı
                                Color.black.opacity(0.3)
                                
                                // Blur efekti
                                VisualEffectBlur(blurStyle: .systemUltraThinMaterialDark)
                            }
                            .edgesIgnoringSafeArea(.bottom)   
                    )
                    
                }
                
            }
            .backgroundImage( "wood")
        }
    }
}

struct headerSection: View {
    var body: some View{
        HStack(spacing: 20){
            HStack{
                Image("pawn")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 22, height: 22)
                
                Image("thropy")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 22, height: 22)
            }
            Spacer()
            
            Image("chesslogo")
                .resizable()
                .scaledToFill()
                .frame(width: 22, height: 22)
            
            Spacer()
            
            Image("friends")
                .resizable()
                .scaledToFill()
                .frame(width: 22, height: 22)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        
    }
}

struct GameMode: View {
    var body: some View {
        HStack(spacing: 12) {
            gameBox(title: "Rapid", imageName: "rapid", score: "822")
            gameBox(title: "Live960", imageName: "chess960", score: "830")
            gameBox(title: "Bullet", imageName: "bullet", score: "596")
            gameBox(title: "Blitz", imageName: "blitz", score: "800")
            gameBox(title: "Puzzles", imageName: "rush", score: "712")
            gameBox(title: "Daily960", imageName: "chess960", score: "800")
        }
        .frame(height: 150)
        .padding(.horizontal, 16)
    }
    
    @ViewBuilder
    func gameBox(title: String, imageName: String, score: String) -> some View {
        VStack() {
            Spacer()
            Text(title)
                .foregroundColor(.gray)
            Spacer()
            Image(imageName)
                .resizable()
                .frame(width: 40, height: 40)
            Spacer()
            Text(score)
                .foregroundColor(.white)
            Spacer()
        }
        .frame(width: 100, height: 100)
        .padding(4)
        .background(Color.black.opacity(0.2))
    }
}

struct PlayButton: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(Color(hex: "81B64C"))
            .frame(height: 56)
            .overlay(
                Text("Play")
                    .font(.system(size: 22, weight: .black))
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
                        .font(.system(size: 16))
                    Text("Solved by 1,378,585")
                        .font(.system(size: 16))
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
                            .font(.system(size: 22, weight: .heavy))
                            .foregroundColor(.white)
                        
                    }
                    
                    VStack(alignment: .leading){
                        HStack{
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
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 140,height: 16)
                            
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color(hex: "FF6B35"))
                                .frame(width: 100, height: 16)
                        }
                    }
                }
                .padding(.bottom, 12)
                
                
            }
            
            
            
        }
        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
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
        //        .background(Color(hex: "1F1C19"))
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

