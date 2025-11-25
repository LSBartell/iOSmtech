//
//  USRepCellView.swift
//  RandomAPI
//
//  Created by Logan Steven Bartell on 11/25/25.
//

import SwiftUI

struct USRepCellView: View {
    let usRep: USRep
    var body: some View {
        VStack{
            Text(usRep.name)
                .font(.title)
                .bold()
                .underline()
            Text("\(usRep.party), \(usRep.state)")
            Text(usRep.link)
        }
    }
}


