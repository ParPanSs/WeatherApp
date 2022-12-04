import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .white]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                
                Text("Prague, PRG")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                
                VStack(spacing: 8) {
                    
                    Image(systemName: "sun.max.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 180, height: 180)
                    
                    HStack {
                        Text("24°")
                            .font(.system(size: 76, weight: .thin))
                            .foregroundColor(.white)
                            .padding()
                        
                        Text("Mon")
                            .font(.system(size: 76, weight: .thin))
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                Spacer()
                HStack(spacing: 15) {
                    
                    WeatherView(dayOfWeek: "TUE", imageOfWeather: "cloud.sun.rain.fill", temperature: 24)
                    WeatherView(dayOfWeek: "WED", imageOfWeather: "cloud.sun.fill", temperature: 24)
                    WeatherView(dayOfWeek: "THU", imageOfWeather: "cloud.sun.bolt.fill", temperature: 24)
                    WeatherView(dayOfWeek: "FRI", imageOfWeather: "sun.max.fill", temperature: 24)
                    WeatherView(dayOfWeek: "SAT", imageOfWeather: "cloud.bolt.fill", temperature: 24)
                    
                }
                Spacer()
            }
        }
    }
    
    struct ContentView_Previews:
        PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

struct WeatherView: View {
    
    var dayOfWeek: String
    var imageOfWeather: String
    var temperature: Int
    
    var body: some View {
        VStack {
            
            Text(dayOfWeek)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: imageOfWeather)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 60, height: 60)
            
            Text("\(temperature)°")
                .font(.system(size: 24, weight: .medium))
                .foregroundColor(.white)
        }
    }
}
