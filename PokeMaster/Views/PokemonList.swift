//
//  PokemonList.swift
//  PokeMaster
//
//  Created by Zheng Kanyan on 2020/9/14.
//  Copyright © 2020 OneV's Den. All rights reserved.
//

import SwiftUI

struct PokemonList: View {
    let models: [PokemonViewModel]
    @State var expandedIndex: Int?
        
    var body: some View {
        VStack {
            ScrollView {
                ForEach(PokemonViewModel.all) { model in
                    PokemonInfoRow(model: model,
                                   expanded: self.expandedIndex == model.id)
                        .onTapGesture {
                            withAnimation(.spring(response: 0.55,
                                                  dampingFraction: 0.45,
                                                  blendDuration: 0)) {
                                if self.expandedIndex == model.id {
                                    self.expandedIndex = nil
                                } else {
                                    self.expandedIndex = model.id
                                }
                            }
                        }
                }
            }
//            List(models, id: \.id) { model in
//                PokemonInfoRow(model: model, expanded: false)
//            }
        }
    }
}

struct PokemonList_Previews: PreviewProvider {
    static var previews: some View {
        PokemonList(models: PokemonViewModel.all)
    }
}
