//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by William Souef on 18/08/2022.
//

import SwiftUI

struct LeaderboardView: View {
    @Binding var game : Game
    @Binding var leaderboardIsShowing: Bool
    
    var body: some View {
        ZStack {
            Color("BackgroundColor").edgesIgnoringSafeArea(.all)
            VStack (spacing:10) {
                HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
                LabelView()
                ScrollView{
                VStack(spacing:10){
                    ForEach(game.leaderboardentries.indices){ i in
                        let leaderboardEntry =
                        game.leaderboardentries[i]
                        RowView(index: i , score: leaderboardEntry.score, date: leaderboardEntry.date)
                    }
                }
                }
            }
                
        }
    }
}
struct RowView: View {
    
    let index : Int
    let score : Int
    let date : Date
    
    
    var body: some View {
        HStack{
     RoundedTextView(text: String(index))
            Spacer()
     ScoreText(score: score)
                .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
            Spacer()
     DateText(date: date)
                .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
            
        }
        .background(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(Color("LeaderboardRowColor")
                ,lineWidth: Constants.General.strokeWidth))
        .padding(.leading)
        .padding(.trailing)
        .frame( maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
        
        
    }
}

struct HeaderView : View {
    @Binding var leaderboardIsShowing: Bool
    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    
    var body: some View{
        ZStack {
            
            HStack{
               
                if verticalSizeClass == .regular && horizontalSizeClass == .compact {
                    BigBoldText(text: "Leaderboard")
                        .padding(.leading)
                    
                Spacer()
                } else {
                BigBoldText(text: "Leaderboard")
                }
                Button(action: {
                     leaderboardIsShowing = false
                }){
                    RoundedImageViewFilled(systemName: "xmark")
                        .padding(.trailing)
                }
        }
    }
}
}
    
struct LabelView : View {
        var body: some View {
            HStack{
                Spacer()
                    .frame(width: Constants.General.roundedViewLength)
                Spacer()
                LabelText(text: "Score")
                    .frame(width: Constants.Leaderboard.leaderboardScoreColWidth)
                Spacer()
                LabelText(text: "Date")
                    .frame(width: Constants.Leaderboard.leaderboardDateColWidth)
            }
            .padding(.leading)
            .padding(.trailing)
            .frame( maxWidth: Constants.Leaderboard.leaderboardMaxRowWidth)
        }
            
    }
struct LeaderboardView_Previews: PreviewProvider {
    
    private static var leaderboardIsShowing = Binding.constant(false)
    private static var game = Binding.constant(Game(loadTestData: true))
    
    static var previews: some View {
        LeaderboardView(game:game, leaderboardIsShowing: leaderboardIsShowing)
        LeaderboardView(game:game, leaderboardIsShowing: leaderboardIsShowing)
            .previewLayout(.fixed(width: 568, height: 320))
        LeaderboardView(game:game, leaderboardIsShowing: leaderboardIsShowing)
            .preferredColorScheme(.dark)
        LeaderboardView(game:game, leaderboardIsShowing: leaderboardIsShowing)
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 568, height: 320))
    }
}

