//
//  RGDoneKeyboard.swift
//  RGDoneKeyboard
//
//  Created by RG on 5/16/20.
//

import Foundation

extension UITextField{
    @IBInspectable var doneAccessory: Bool{
        get{
            return self.doneAccessory
        }
        set (hasDone) {
            if hasDone{
                addDoneButtonOnKeyboard()
            }
        }
    }

    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()

        self.inputAccessoryView = doneToolbar
    }

    @objc func doneButtonAction()
    {
        self.resignFirstResponder()
    }
}

extension UITextView{
    @IBInspectable var doneAccessory: Bool{
        get{
            return self.doneAccessory
        }
        set (hasDone) {
            if hasDone{
                addDoneButtonOnKeyboard()
            }
        }
    }

    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        doneToolbar.barStyle = .default

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneButtonAction))

        let items = [flexSpace, done]
        doneToolbar.items = items
        doneToolbar.sizeToFit()

        self.inputAccessoryView = doneToolbar
    }

    @objc func doneButtonAction()
    {
        self.resignFirstResponder()
    }
}

extension UIViewController {

    public func RGDoneKeyboard(dismissOnTap:Bool) {
        // Setup Keyboard observers
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        
        // Setup Tap Gesture to dismiss keyboard on tap
        if dismissOnTap {
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
            self.view.addGestureRecognizer(tap)
        }
        
    }
    
    // Handle Tap Gesture
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }

    @objc func keyboardWillChange(notification: Notification) {
        var location: CGFloat = 0
        var tfvHeight: CGFloat = 0
        
        // Get current firstResponder and check if it is a TextField
        if let activeTextField = UIResponder.currentFirstResponder as? UITextField {
            
            // Get the height of the Text Field
            tfvHeight = activeTextField.frame.size.height
            
            // Check if we can get its origin w.r.t. screen
            if let globalPoint = activeTextField.superview?.convert(activeTextField.frame.origin, to: nil) {
                
                // Set the y coordinate in location
                location = globalPoint.y
            }
        } else {
            
            // Get current firstResponder and check if it is a TextView
            if let activeTextView = UIResponder.currentFirstResponder as? UITextView {
                
                // Get the height of the Text View
                tfvHeight = activeTextView.frame.size.height
                
                // Check if we can get its origin w.r.t. screen
                if let globalPoint = activeTextView.superview?.convert(activeTextView.frame.origin, to: nil) {
                    
                    // Set the y coordinate in location
                    location = globalPoint.y
                }
            }
        }
        
        // Calculate keyboard size
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        
        if notification.name == UIResponder.keyboardWillChangeFrameNotification || notification.name == UIResponder.keyboardWillShowNotification {
            
            // Check if location is > (ViewHeight - KeyboardHeight - TextFieldOrViewHeight - Margin8)
            if(location > (self.view.frame.height - keyboardSize.height - tfvHeight - 8) ) {
                
                // Pull the screen up by location + TextFieldOrViewHeight + Margin8 - (ViewHeight - KeyboardHeight)
                let pullUp = location + tfvHeight + 8 - (self.view.frame.height - keyboardSize.height)
                
                // Pull the screen frame up by the calculated value
                view.frame.origin.y = -pullUp
            }
        } else {
            
            // Reset the frame
            view.frame.origin.y = 0
        }
    }
}

extension UIResponder {

    private static weak var _currentFirstResponder: UIResponder?

    static var currentFirstResponder: UIResponder? {
        _currentFirstResponder = nil
        UIApplication.shared.sendAction(#selector(UIResponder.findFirstResponder(_:)), to: nil, from: nil, for: nil)

        return _currentFirstResponder
    }

    @objc func findFirstResponder(_ sender: Any) {
        UIResponder._currentFirstResponder = self
    }
}
