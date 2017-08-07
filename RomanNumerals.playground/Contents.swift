let baseNumerals = [1:"I",5:"V",10:"X",50:"L",100:"C",500:"D",1000:"M"]

func romanNumeral(number : Int) -> String {
    
    guard number > 0 else {
        return ""
    }
    
    var anchor = 1
    var delta = 1
    var lowerBound = 4
    
    for i in [1,10,100] {
        if number >= lowerBound {
            anchor *= 5
            if number >= anchor + lowerBound {
                anchor *= 2
            }
            delta = i
        }
        lowerBound *= 10
    }
    
    if let anchorString = baseNumerals[anchor] {
        if number >= anchor {
            return anchorString + romanNumeral(number: number - anchor)
        } else {
            return baseNumerals[delta]! + anchorString + romanNumeral(number: number - anchor + delta)
        }
    }
    return ""
}

for i in 1..<4000 {
    print("\(i) = \(romanNumeral(number: i))")
}

