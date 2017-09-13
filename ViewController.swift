import UIKit

class ViewController: UIViewController {
    //Initialize value display in UI
    
    
    @IBOutlet weak var DisplayValue: UILabel!
    
    //Initialize values for calculation
    var StoredValue: Double = 0.0
    var DisplayNumber: Double = 0.0
    var Operation: Int = 0
    
    //Creates a function that is called when a action is recieved from the user
    
    @IBAction func Keys(_ sender: UIButton) {
    
    
        if (sender.tag > 0 && sender.tag < 11) { //Values corresponding to numeric values
            DisplayValue.text = DisplayValue.text! + String(sender.tag-1) //Displays updated value (string)
            DisplayNumber = Double(DisplayValue.text!)! //Converts the Display to a numeric value (double)
        }
        else if (sender.tag == 11){ //If the Clear button is pressed
            StoredValue = 0
            DisplayValue.text = "0"
            DisplayNumber = 0
        }
        else if (sender.tag == 12){ //If the Positive/Negative button is pressed
            DisplayValue.text = "-" + DisplayValue.text!
            DisplayNumber = DisplayNumber * -1
        }
        else if (sender.tag == 13){ // If the Decimal button is pressed
            DisplayValue.text = DisplayValue.text! + "."
        }
        else if (sender.tag > 13 && sender.tag < 18){ //If an operational button is pressed (stores operation)
            StoredValue = DisplayNumber
            if (sender.tag == 14){
                Operation = 1
            }
            else if (sender.tag == 15){
                Operation = 2
            }
            else if (sender.tag == 16){
                Operation = 3
            }
            else {
                Operation = 4
            }
            DisplayNumber = 0
            DisplayValue.text = "0"
        }
        else if (sender.tag == 100){ //If Equals Button is pressed, calculates based on operation input
            if (Operation == 1){
                StoredValue = StoredValue - DisplayNumber
            }
            else if (Operation == 2){
                StoredValue = StoredValue + DisplayNumber
            }
            else if (Operation == 3){
                StoredValue = StoredValue / DisplayNumber
            }
            else if (Operation == 4){
                StoredValue = StoredValue * DisplayNumber
            }
            DisplayValue.text = String(StoredValue)
        }
        else{
            DisplayValue.text = "Broken"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

