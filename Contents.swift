//var move: Int = 0
//var lastUnchangedNumber: Int = 0
//var greatestNumber: Int = 0
//
//func countMoves(numbers: [Int]) -> Int {
//    move += 1
//    arrange(numbers: numbers)
//    return move
//}
//
//func arrange(numbers: [Int]) {
//    let newArray: [Int] = updateArray(numbers: numbers)
//    let decreasedArray: [Int] = decrease(lastNumber: greatestNumber, of: newArray, by: 1)
//    runNewMoveIfNeeded(for: decreasedArray)
//}
//
//func updateArray(numbers: [Int]) -> [Int] {
//    var newArray: [Int] = []
//    greatestNumber = 0
//
//    numbers.forEach {
//        let newNumber = $0 + 1
//        newArray.append(newNumber)
//        updateGreatestNumber(with: newNumber)
//    }
//    return newArray
//}
//
//func updateGreatestNumber(with number: Int) {
//    greatestNumber = number > greatestNumber ? number : greatestNumber
//}
//
//func decrease(lastNumber: Int, of array: [Int], by amount: Int) -> [Int] {
//    var newArray: [Int] = array
//
//    if let row = newArray.lastIndex(where: { $0 == lastNumber }) {
//        lastUnchangedNumber = greatestNumber - amount
//        newArray[row] = lastUnchangedNumber
//    }
//    return newArray
//}
//
//func runNewMoveIfNeeded(for numbers: [Int]) {
//    guard hasDifferentNumbers(in: numbers) else { return }
//    move += 1
//    arrange(numbers: numbers)
//}
//
//func hasDifferentNumbers(in numbers: [Int]) -> Bool {
//    return numbers.contains { $0 != lastUnchangedNumber }
//}
//
//countMoves(numbers: [3,  4,  6,  6,  3])

var move: Int = 0

func countMoves(numbers: [Int]) -> Int {
    move += 1
    arrange(numbers: numbers)
    return move
}

func arrange(numbers: [Int]) {
    let newArray: (newArray: [Int], greatestNumber: Int) = updateArray(numbers: numbers)
    let decreasedArray: (numbers: [Int], lastUnchangedNumber: Int) = decrease(greatestNumber: newArray.greatestNumber, of: newArray.newArray, by: 1)
    runNewMoveIfNeeded(for: decreasedArray)
}

func updateArray(numbers: [Int]) -> (newArray: [Int], greatestNumber: Int) {
    var newArray: [Int] = []
    var greatestNumber = 0
    
    numbers.forEach {
        let newNumber = $0 + 1
        newArray.append(newNumber)
        greatestNumber = newNumber > greatestNumber ? newNumber : greatestNumber
    }
    return (newArray: newArray, greatestNumber: greatestNumber)
}

func decrease(greatestNumber: Int, of array: [Int], by amount: Int) -> (numbers: [Int], lastUnchangedNumber: Int) {
    var newArray: [Int] = array
    var lastUnchangedNumber: Int = 0
    
    if let row = newArray.lastIndex(where: { $0 == greatestNumber }) {
        lastUnchangedNumber = greatestNumber - amount
        newArray[row] = lastUnchangedNumber
    }
    return (numbers: newArray, lastUnchangedNumber: lastUnchangedNumber)
}

func runNewMoveIfNeeded(for lastMove: (numbers: [Int], lastUnchangedNumber: Int)) {
    guard hasDifferentNumbers(in: lastMove) else { return }
    move += 1
    arrange(numbers: lastMove.numbers)
}

func hasDifferentNumbers(in lastMove: (numbers: [Int], lastUnchangedNumber: Int)) -> Bool {
    return lastMove.numbers.contains { $0 != lastMove.lastUnchangedNumber }
}

countMoves(numbers: [3,  4,  6,  6,  3])
