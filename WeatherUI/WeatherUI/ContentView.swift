import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    @State private var dayOfWeek = ["MON", "TUE", "WED",
                                    "THU", "FRI", "SAT", "SUN"]
    
    
    var body: some View {
        ZStack {
            
            BackgroundView(topColor: isNight ? .black : .blue,
                           bottomColor: isNight ? .gray : .white)
            VStack {
                
                CityView(city: "Prague")
                VStack(spacing: 8) {
                    
                    TodayWeatherView(weatherImageName: "snowflake")
                    HStack {
                        
                        DayAndWeatherView(temperature: -2, weather: "Snow")
                    }
                }
                Spacer()
                HStack(spacing: 15) {
                    
                    WeatherView(dayOfWeek: dayOfWeek[0], imageOfWeather: "cloud.sun.rain.fill", temperature: 24)
                    WeatherView(dayOfWeek: dayOfWeek[1], imageOfWeather: "cloud.sun.fill", temperature: 24)
                    WeatherView(dayOfWeek: dayOfWeek[2], imageOfWeather: "cloud.sun.bolt.fill", temperature: 24)
                    WeatherView(dayOfWeek: dayOfWeek[3], imageOfWeather: "sun.max.fill", temperature: 24)
                    WeatherView(dayOfWeek: dayOfWeek[4], imageOfWeather: "cloud.bolt.fill", temperature: 24)
                }
                
                Spacer()
                
                Button{
                    
                    isNight = !isNight
                } label: {
                    
                    WeatherButton(title: "Change day time",
                                  textColor: isNight ? .white : .blue,
                                  backgroundColor: isNight ? .gray : .white)
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

struct BackgroundView: View {
    
    var topColor: Color
    var bottomColor: Color
    
    var body: some View{
        LinearGradient(gradient: Gradient(colors: [topColor, bottomColor]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityView: View {
    
    var city: String
    
    var body: some View {
        Text(city)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct TodayWeatherView: View {
    
    var weatherImageName: String
    
    var body: some View{
        Image(systemName: weatherImageName)
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 100, height: 100)
    }
}

struct DayAndWeatherView: View {
    
    var temperature: Int
    var weather: String
    
    var body: some View {
        Text("\(temperature)°")
            .font(.system(size: 76, weight: .thin))
            .foregroundColor(.white)
            .padding()
        
        Text(weather)
            .font(.system(size: 50, weight: .thin))
            .foregroundColor(.white)
            .padding()
    }
}

struct WeatherButton: View {
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    var body: some View {
        Text(title)
            .frame(width: 250, height: 50)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
