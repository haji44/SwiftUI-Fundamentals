//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by kitano hajime on 2022/01/30.
//

import SwiftUI

struct ContentView: View {
    
    // avoid destroy this value
    // to keep the variable
    @State private var isNight  = false // flag change UI
    @State var number           = 0
    @State var cityName         = "Tokyo"
    
    var body: some View {
        ZStack {
            BackGroundView(isNaight: $isNight) // $ indicate that the isNight is the same to child view's property
            
            VStack {
                CityTextView(cityName: cityName)

                // TODO: excute creating WeatherMainView method
                // createWeatherMainView()
                MainWeatherStateView(temperature: 40, imageName:  "cloud.sun.fill")
                
                .padding(.bottom, 40)
                HStack(spacing: 20) {
                    // TODO: excute create view
                    // createView() <- I want to excute this method
                    
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperature: 74)
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.sun.fill", temperature: 74)
                    WeatherDayView(dayOfWeek: "THU", imageName: "cloud.sun.fill", temperature: 74)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "cloud.sun.fill", temperature: 74)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.sun.fill", temperature: 74)
                }
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    // MARK: outlook
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .background(.white)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .cornerRadius(10)
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Double
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temperature)")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackGroundView: View {
    
    // keep to coincide the value
    // Binding need to declare before variable declaration
    @Binding var isNaight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNaight ? .black :.blue, isNaight ? .gray: Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text("\(cityName)")
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStateView: View {
    
    var temperature: Double
    var imageName: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
                
            Text("68°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }.padding(40)
    }
}


extension ContentView {
    func createWeatherMainView() {
        Task {
            do {
                let weather = try await NetWorkManager.shared.getWeatherData(by: cityName)
                let datum = weather.data[0]
                let code = datum.weather.code / 100
                
                MainWeatherStateView(temperature: datum.temp, imageName: SFSymbol.getSFSymbolString(flag: isNight, in: code))
            } catch {
                if let error = error as? WeatherError {
                    print(error.rawValue)
                }
            }
        }
    }
    
    func createWeatherDayView() {
        Task {
            do {
                let weather = try await NetWorkManager.shared.getWeatherData(by: cityName)
                let data = weather.data[1...5]
                
                for datum in data {
                    let code = datum.weather.code / 100
                    WeatherDayView(dayOfWeek: datum.datetime.toDaysOfWeek(), imageName: SFSymbol.getSFSymbolString(flag: isNight, in: code), temperature: datum.temp)
                }
            } catch {
                if let error = error as? WeatherError {
                    print(error.rawValue)
                }
            }
        }
    }
}
