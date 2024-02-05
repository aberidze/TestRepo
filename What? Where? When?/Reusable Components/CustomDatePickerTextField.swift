//
//  CustomDatePickerTextField.swift
//  What? Where? When?
//
//  Created by Macbook Air 13 on 05.02.24.
//

import UIKit

final class CustomDatePickerTextField: CustomTextField {
    
    // MARK: - Properties
    private let datePicker: UIDatePicker = {
        let picker = UIDatePicker()
        picker.datePickerMode = .date
        picker.preferredDatePickerStyle = .wheels
        return picker
    }()
    
    
    // MARK: - Initializers
    override init(placeholder: String, borderColor: UIColor, icon: String, isPassword: Bool? = false) {
        super.init(placeholder: placeholder, borderColor: borderColor, icon: icon)
        setupDatePickerTextField()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    // MARK: - Private Methods
    private func setupDatePickerTextField() {
        setupDatePicker()
        setupTextField()
    }
    
    private func setupDatePicker() {
        datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: .valueChanged)
        inputView = datePicker
    }
    
    private func setupTextField() {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
        toolbar.items = [space, doneButton]
        
        inputAccessoryView = toolbar
    }
    
    
    // MARK: - Actions
    @objc private func doneButtonTapped() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        text = dateFormatter.string(from: datePicker.date)
        
        resignFirstResponder()
    }
    
    @objc private func datePickerValueChanged() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        text = dateFormatter.string(from: datePicker.date)
    }
}
