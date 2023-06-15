import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameTextField.keyboardType = .default
        nameTextField.spellCheckingType = .no
        emailTextField.keyboardType = .emailAddress
        emailTextField.spellCheckingType = .no
        passwordTextField.keyboardType = .default
        passwordTextField.isSecureTextEntry = true
        
        nameTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        registerButton.isEnabled = false
        registerButton.setTitleColor(.white.withAlphaComponent(0.4), for: .disabled)
        registerButton.setTitleColor(.white, for: .normal)
    }

    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        print(">>> name: \(nameTextField.text ?? "")")
        print(">>> e-mail: \(emailTextField.text ?? "")")
        print(">>> password: \(passwordTextField.text ?? "")")
    }
    
    func validateTextField() {
        if nameTextField.text != "" && emailTextField.text != "" && passwordTextField.text != "" && passwordTextField.text?.count ?? 0 > 5 {
            registerButton.isEnabled = true
        } else {
            registerButton.isEnabled = false
        }
    }
    
}
    
extension ViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        textField.layer.borderColor = UIColor.blue.cgColor
        textField.layer.borderWidth = 1
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 0
        print(#function)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print(#function)
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        validateTextField()
    }
}

