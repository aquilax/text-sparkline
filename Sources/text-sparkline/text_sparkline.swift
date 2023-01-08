public struct text_sparkline {
    public private(set) var steps = "▁▂▃▄▅▆▇█"

    private func normalize(_ numbers: [Float], _ stepCount: Int) -> [Int] {
        if numbers.isEmpty {
            return [];
        }
        let minNumber = numbers.min() ?? 0;
        let numbersCapped = numbers.map({
            (numb: Float) ->  Float in
            return numb - minNumber
        });

        guard let max = numbersCapped.max() else { return [] }

        let normalizedMax = max == 0 ? 1 : max;

        return numbersCapped.map({
            (n: Float) -> Int in
            let t = n / normalizedMax;
            let tInt = Int(t * Float(stepCount));
            return tInt == stepCount ? stepCount - 1 : tInt;
        });
    }

    public func generate(_ numbers: [Float]) -> String {
        if numbers.isEmpty {
            return "";
        }
        let stepsArray = Array(steps)
        let indexes = normalize(numbers, stepsArray.count);
        return indexes.reduce("") {r, i in r + String(stepsArray[i])}
    }
}
