//
//  ChessView.swift
//  ChessClone
//
//  Created by Omer on 11.09.2025.
//

import SwiftUI

struct ChessView: View {
    var body: some View {
        ZStack {
            // Dark brown background
            Color(hex: "312E2B")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                // Header
                HeaderSection1()
                
                // Scrollable Content
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 16) {
                        // Solve Puzzles Card
                        SolvePuzzlesCard1()
                        
                        // Daily Puzzle Card
                        DailyPuzzleCard1()
                        
                        // Next Lesson Card
                        NextLessonCard1()
                    }
                    .padding(.horizontal, 16)
                    .padding(.top, 8)
                }
                
                // Bottom Section
                VStack(spacing: 0) {
                    // Game Mode Selector
                    GameModeSelector()
                    
                    // Play Button
                    PlayButton1()
                        .padding(.horizontal, 16)
                        .padding(.bottom, 8)
                    
                    // Tab Bar
                    
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}



// MARK: - Header Section
struct HeaderSection1: View {
    var body: some View {
        HStack(spacing: 20) {
            // Profile Icon
            RoundedRectangle(cornerRadius: 8)
                .fill(Color.gray.opacity(0.3))
                .frame(width: 44, height: 44)
                .overlay(
                    Image(systemName: "person.fill")
                        .foregroundColor(.gray)
                )
            
            // Trophy Icon
            Image(systemName: "trophy.fill")
                .font(.system(size: 28))
                .foregroundColor(Color(hex: "FFB800"))
            
            Spacer()
            
            // Chess.com Logo
            HStack(spacing: 6) {
                Image(systemName: "crown.fill")
                    .foregroundColor(Color(hex: "81B64C"))
                Text("Chess.com")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
            }
            
            Spacer()
            
            // Friends Icon
            Image(systemName: "person.2.fill")
                .font(.system(size: 24))
                .foregroundColor(.gray)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color(hex: "1F1C19").opacity(0.5))
    }
}

// MARK: - Solve Puzzles Card
struct SolvePuzzlesCard1: View {
    var body: some View {
        HStack(spacing: 16) {
            // Chess Board
            ChessBoardView(showPieces: true)
                .frame(width: 140, height: 140)
            
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
                        .font(.system(size: 28, weight: .bold))
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
            
            Spacer()
        }
        .padding(16)
        .background(Color(hex: "3E3A36"))
        .cornerRadius(12)
    }
}

// MARK: - Daily Puzzle Card
struct DailyPuzzleCard1: View {
    var body: some View {
        HStack(spacing: 16) {
            // Chess Board with position
            ChessBoardView(showPieces: false, isDailyPuzzle: true)
                .frame(width: 140, height: 140)
            
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
            
            Spacer()
        }
        .padding(16)
        .background(Color(hex: "3E3A36"))
        .cornerRadius(12)
    }
}

// MARK: - Next Lesson Card
struct NextLessonCard1: View {
    var body: some View {
        HStack(spacing: 16) {
            // Empty Chess Board
            ChessBoardView(showPieces: false)
                .frame(width: 140, height: 140)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Next Lesson")
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(.white)
                
                Text("The Goals Of Chess")
                    .font(.system(size: 14))
                    .foregroundColor(Color.gray)
                
                Spacer()
                
                // Lesson Icon
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color(hex: "4A90E2").opacity(0.2))
                    .frame(width: 56, height: 56)
                    .overlay(
                        Image(systemName: "graduationcap.fill")
                            .font(.system(size: 28))
                            .foregroundColor(Color(hex: "4A90E2"))
                    )
            }
            
            Spacer()
        }
        .padding(16)
        .background(Color(hex: "3E3A36"))
        .cornerRadius(12)
    }
}

// MARK: - Chess Board View
struct ChessBoardView: View {
    let showPieces: Bool
    var isDailyPuzzle: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(0..<8) { row in
                HStack(spacing: 0) {
                    ForEach(0..<8) { col in
                        ZStack {
                            Rectangle()
                                .fill((row + col) % 2 == 0 ?
                                      Color(hex: "F0D9B5") :
                                      Color(hex: "B58863"))
                            
                            // Initial position pieces
                            if showPieces {
                                ChessPiece(row: row, col: col)
                            }
                            
                            // Daily puzzle position
                            if isDailyPuzzle {
                                DailyPuzzlePiece(row: row, col: col)
                            }
                        }
                        .frame(width: 17.5, height: 17.5)
                    }
                }
            }
        }
        .overlay(
            RoundedRectangle(cornerRadius: 2)
                .stroke(Color.gray.opacity(0.3), lineWidth: 1)
        )
    }
}

// MARK: - Chess Pieces
struct ChessPiece: View {
    let row: Int
    let col: Int
    
    var body: some View {
        if let piece = getPiece(row: row, col: col) {
            Text(piece)
                .font(.system(size: 13))
        }
    }
    
    func getPiece(row: Int, col: Int) -> String? {
        // Black pieces
        if row == 0 {
            let blackPieces = ["♜", "♞", "♝", "♛", "♚", "♝", "♞", "♜"]
            return blackPieces[col]
        } else if row == 1 {
            return "♟"
        }
        // White pieces
        else if row == 6 {
            return "♙"
        } else if row == 7 {
            let whitePieces = ["♖", "♘", "♗", "♕", "♔", "♗", "♘", "♖"]
            return whitePieces[col]
        }
        return nil
    }
}

// MARK: - Daily Puzzle Pieces
struct DailyPuzzlePiece: View {
    let row: Int
    let col: Int
    
    var body: some View {
        Group {
            if row == 0 && col == 3 {
                Text("♛")
                    .font(.system(size: 13))
            } else if row == 1 && col == 1 {
                Text("♚")
                    .font(.system(size: 13))
            } else if row == 0 && col == 0 {
                Text("♜")
                    .font(.system(size: 13))
            } else if row == 0 && col == 7 {
                Text("♜")
                    .font(.system(size: 13))
            } else if row == 3 && col == 3 {
                Text("♙")
                    .font(.system(size: 13))
            } else if row == 4 && col == 4 {
                Text("♞")
                    .font(.system(size: 13))
            } else if row == 5 && col == 2 {
                Text("♙")
                    .font(.system(size: 13))
            } else if row == 6 && col == 3 {
                Text("♔")
                    .font(.system(size: 13))
            } else if row == 6 && col == 7 {
                Text("♖")
                    .font(.system(size: 13))
            } else if row == 7 && col == 5 {
                Text("♚")
                    .font(.system(size: 13))
            }
        }
    }
}

// MARK: - Game Mode Selector
struct GameModeSelector: View {
    var body: some View {
        HStack(spacing: 60) {
            // Rapid
            VStack(spacing: 6) {
                Image(systemName: "clock.fill")
                    .font(.system(size: 24))
                    .foregroundColor(Color(hex: "81B64C"))
                Text("Rapid")
                    .font(.system(size: 12))
                    .foregroundColor(.white)
            }
            
            // Live960
            VStack(spacing: 6) {
                ZStack {
                    Image(systemName: "clock.fill")
                        .font(.system(size: 24))
                        .foregroundColor(.gray)
                    Text("960")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(Color(hex: "FF6B35"))
                        .offset(y: 16)
                }
                Text("Live960")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
            
            // Daily
            VStack(spacing: 6) {
                Image(systemName: "sun.max.fill")
                    .font(.system(size: 24))
                    .foregroundColor(.gray)
                Text("Daily")
                    .font(.system(size: 12))
                    .foregroundColor(.gray)
            }
        }
        .padding(.vertical, 16)
        .frame(maxWidth: .infinity)
        .background(Color(hex: "1F1C19"))
    }
}

// MARK: - Play Button
struct PlayButton1: View {
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

// MARK: - Custom Tab Bar


// MARK: - Color Extension
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ChessView()
    }
}
