//
// Copyright (c) 2017 Juan C Perez
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of
// this software and associated documentation files (the "Software"), to deal in
// the Software without restriction, including without limitation the rights to
// use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
// the Software, and to permit persons to whom the Software is furnished to do so,
// subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
// FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
// COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
// IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
//  Created by Juan C Perez on 8/1/17.
//  Copyright (c) 2017 Juan C Perez. All rights reserved.
//

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

