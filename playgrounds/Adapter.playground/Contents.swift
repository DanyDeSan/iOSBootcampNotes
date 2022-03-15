import UIKit

struct FahrenheitTemperature {
    var value: Double
}

struct CelciusTemperature {
    var value: Double
}

class CelciusTermometer {
    func obtainTemperature() -> CelciusTemperature {
        return CelciusTemperature(value: 28)
    }
}


class FahrenheitAdapter: CelciusTermometer {
    private var fahrenheitTemperature: FahrenheitTemperature
    
    init(fahrenheitTemperature: FahrenheitTemperature) {
        self.fahrenheitTemperature = fahrenheitTemperature
    }
    
    override func obtainTemperature() -> CelciusTemperature {
        let value: Double = fahrenheitTemperature.value
        let celciusValue: Double = (value - 32) * (5/9)
        return CelciusTemperature(value: celciusValue)
    }
}


final class CelciusTemperatureReader {
    
    var lastCelciusRead: CelciusTemperature?
    
    func readTemperature(from termometer: CelciusTermometer) {
        print("The readings are \(termometer.obtainTemperature().value) °C")
    }
}

let celciusReader: CelciusTemperatureReader = CelciusTemperatureReader()

let celciusTermometer: CelciusTermometer = CelciusTermometer()
celciusReader.readTemperature(from: celciusTermometer)

let fahrenheitAdapter: FahrenheitAdapter = FahrenheitAdapter(fahrenheitTemperature: FahrenheitTemperature(value: 85))

celciusReader.readTemperature(from: fahrenheitAdapter)
