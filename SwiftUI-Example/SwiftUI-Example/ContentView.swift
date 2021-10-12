//
//  ContentView.swift
//  SwiftUI-Example
//
//  Created by Sergey Shcherbak on 10.10.2021.
//

import SwiftUI
import BasisIDSdk

struct ContentView: View {
    @State var verify = false;
    
    func callback(_ status: String, _ code: String) {
        print(status, code)
        switch status {
        // ok status
        case "ok":
            switch code {
            case "video":
                print("first step completed")
            case "full":
                print("verification completed")
            default:
                break
            }
        // error status
        case "error":
            switch code {
            case "api":
                print("api system error")
            case "step_timeout":
                print("verification step timeout exceed")
            case "manual_review":
                print("profile sent to manual review")
            default:
                break
            }
        default:
            break
        }
    }
    
    var body: some View {
        if !verify {
            Button(action: {
                verify = true
            }) {
                Text("Verify me")
            }
        } else {
            BasisIDView(apiKey: "prod-VeiSnSqJqqbnwxkFMViqTslblyiJaXFX",
                        apiFormToken: "2fdc6057-7400-48b7-8f86-3841dbc202b0",
                        region: "europe", callback: callback)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
