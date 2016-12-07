//
//  ViewController.swift
//  LittleCountingDrill
//
//  Created by Jacob Oscarson on 2016-12-06.
//
// MIT License
//
// Copyright (c) 2016 Jacob Oscarson

// Permission is hereby granted, free of charge, to any person
// obtaining a copy of this software and associated documentation
// files (the "Software"), to deal in the Software without
// restriction, including without limitation the rights to use, copy,
// modify, merge, publish, distribute, sublicense, and/or sell copies
// of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
// BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
// ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
// CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//

import UIKit

class ViewController: UIViewController {

  let AMOUNT_STEP : Float = 10.0

  @IBOutlet weak var hardSwitch: UISwitch!
  @IBOutlet weak var amountLabel: UILabel!
  @IBOutlet weak var amountWidget: UISlider!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func getAmount() -> Float {
    return roundf(amountWidget.value / AMOUNT_STEP)
  }

  @IBAction func amountChanged(_ slider: UISlider) {
    let step = self.getAmount()
    self.amountLabel.text = String(Int(step))
    slider.value = step * AMOUNT_STEP
  }

  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if(segue.identifier == "questionSegue") {
      let qController = (segue.destination as! QuestionController)
      qController.exercises = (sender as! Exercises)
      //NSLog("%@", qcontroller)
    }
  }

  @IBAction func onStart(_ sender: Any) {
    let exercises = Exercises(Int(self.getAmount()),
                              preferHard:self.hardSwitch.isOn)
    self.performSegue(withIdentifier: "questionSegue",
                       sender:exercises)
  }
}
