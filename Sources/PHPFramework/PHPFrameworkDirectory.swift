//
// PHP Framework
// PHPFramework is a collection of the most common PHP functions, implemented in Swift.
//
// https://github.com/0xWDG/PHPFramework
//
// File:    PHPFrameworkDirectory.swift
// Created: 24-JAN-2016
// Creator: Wesley de Groot | @0xWDG
// Issue:   #7 (Directory Functions)
// Prefix:  PFD

import Foundation

/// PHPFramework
///
/// A Swift framework inspired by some PHP Functions.
extension PHPFramework {

	/// *Dummy** Change directory
	///
	/// - Parameter dir: String
	public func chdir(_ dir: String) {}

	/// *Dummy** Change the root directory
	///
	/// - Parameter dir: String
	public func chroot(_ dir: String) {}

	/// *Dummy** Close directory handle
	///
	/// - Parameter dir: String
	public func closedir(_ dir: String) {}

	/// Return an instance of the Directory class (**Not supported**)\
	/// Maybe later this will be supported, it needs to become a own class, within the php class.
	///
	/// - Parameter dir: String
	///
	/// - Returns: false
	public func dir(_ dir: String) -> Bool {
		print("Not supported")
		return false
	}

	/// Gets the current working directory
	///
	/// - Returns: Document directory
	public func getcwd() -> String {
        guard let documentDirectoryURL = try? FileManager().url(
            for: .documentDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: true
        ) else {
            return FileManager.default.currentDirectoryPath
        }

        return documentDirectoryURL.relativePath
	}

	/// Open directory handle
	///
	/// Secretly a dummy, wich returns the directory url*
	///
	/// - Parameter dir: String
	///
	/// - Returns: directory url
	public func opendir(_ dir: String) -> String {
		return dir
	}

	/// Read entry from directory handle
	///
	/// - Parameter dir: String
	///
	/// - Returns: a Array<String> of all the files
	public func readdir(_ dir: String) -> [String] {
		var returnArray: [String] = [String]()

		// Will also loop trough subdirectory's :(
		// let filemanager: NSFileManager = NSFileManager()
		// if (filemanager.fileExistsAtPath(dir)) {
		// . let files = filemanager.enumeratorAtPath(dir)
		// . while let file = files?.nextObject() {
		// .  _returnArray.append(file as! String)
		// . }
		// } else {
		// . print("Error, path \(dir) does not exists")
		// }

        let directoryURL = URL(string: dir) ?? URL(fileURLWithPath: dir)
        if let directoryUrls = try? FileManager.default.contentsOfDirectory(
            at: directoryURL,
            includingPropertiesForKeys: nil,
            options: FileManager.DirectoryEnumerationOptions.skipsSubdirectoryDescendants
        ) {
            returnArray.reserveCapacity(directoryUrls.count)
            for directoryUrl in directoryUrls {
                returnArray.append(directoryUrl.lastPathComponent)
            }
        }

		return returnArray
	}

	/// *Dummy** Rewind directory handle
	///
	/// - Parameter dir: String
	public func rewinddir(_ dir: String) {}

	/// List files and directories inside the specified path
	///
	/// - Parameter dir: String
	///
	/// - Returns: a Array<String> of all the files
	public func scandir(_ dir: String) -> [String] {
		return readdir(dir)
	}
}
