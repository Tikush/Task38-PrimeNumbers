//
//  ViewController.swift
//  Task38-TikoJanikashvili
//
//  Created by Tiko on 25.06.21.
//

import UIKit

class ViewController: UIViewController {
    
    

    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.button.layer.cornerRadius = 10
    }

    @IBAction func start(_ sender: UIButton) {
        self.button.isUserInteractionEnabled = false
        self.button.alpha = 0.7
        DispatchQueue.global(qos: .utility).async {
            let result = self.primes(upTo: 100000)
            if !result.isEmpty {
                print(result)
                DispatchQueue.main.async {
                    self.button.isUserInteractionEnabled = true
                    self.button.alpha = 1
                }
            }
        }
    }
    
    func primes(upTo rangeEndNumber: Int) -> [Int] {
        
        let firstPrime = 2
        guard rangeEndNumber >= firstPrime else {
            fatalError("End of range has to be greater than or equal to \(firstPrime)!")
        }
        var numbers = Array(firstPrime...rangeEndNumber)
        var currentPrimeIndex = 0
        while currentPrimeIndex < numbers.count {
            let currentPrime = numbers[currentPrimeIndex]
            var numbersAfterPrime = numbers.suffix(from: currentPrimeIndex + 1)
            numbersAfterPrime.removeAll(where: { $0 % currentPrime == 0 })
            numbers = numbers.prefix(currentPrimeIndex + 1) + Array(numbersAfterPrime)
            currentPrimeIndex += 1
        }
        return numbers
    }
}



