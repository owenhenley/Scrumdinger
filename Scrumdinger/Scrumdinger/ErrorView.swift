//
//  ErrorView.swift
//  Scrumdinger
//
//  Created by Owen Henley on 06/03/2023.
//

import SwiftUI

struct ErrorView: View {
    let errorWrapper: ErrorWrapper
    
    var body: some View {
        VStack {
            Text("This is an Error Message")
                .font(.title)
                .padding(.bottom)
            Text("Error Description is that this is an error")
                .font(.headline)
            Text("This is guidence, to remove the error something has to work")
                .font(.caption)
                .padding(.top)
            Spacer()
        }
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(16)
    }
}

struct ErrorView_Previews: PreviewProvider {
    enum errorSample: Error {
        case testError
    }
    
    static var previews: some View {
        ErrorView(errorWrapper: ErrorWrapper(error: errorSample.testError, guidance: "This is an example"))
    }
}
