//
//  ViewController.swift
//  replacer
//
//  Created by Johnson Lai on 12/06/2017.
//  Copyright © 2017 johnsonlwh7. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    @IBOutlet weak var inputField: NSTextField!
    @IBOutlet weak var outputLbl: NSTextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    @IBAction func sendBtn(_ sender: Any) {
        var inputStr: String
        if let _inputStr = inputField.stringValue as? String{
            inputStr = _inputStr.replacingOccurrences(of: "\"", with: "\\\"")
        } else {
            inputStr = "No input"
        }
        
        
        outputLbl.stringValue = inputStr
    }

    @IBAction func copyBtn(_ sender: Any) {
        // Set string to clipboard
        let convertedStr = outputLbl.stringValue
        
        let pasteboard = NSPasteboard.general()
        pasteboard.declareTypes([NSPasteboardTypeString], owner: nil)
        pasteboard.setString(convertedStr, forType: NSPasteboardTypeString)
        
        var clipboardItems: [String] = []
        for element in pasteboard.pasteboardItems! {
            if let str = element.string(forType: "public.utf8-plain-text") {
                clipboardItems.append(str)
            }
        }
        
        // Access the item in the clipboard
        let firstClipboardItem = clipboardItems[0]
    }
}

