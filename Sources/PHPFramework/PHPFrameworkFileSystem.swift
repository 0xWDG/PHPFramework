//
// PHP Framework
// PHPFramework is a collection of the most common PHP functions, implemented in Swift.
//
// https://github.com/0xWDG/PHPFramework
//
// File:    PHPFrameworkFileSystem.swift
// Created: 21-JAN-2016
// Creator: Wesley de Groot | @0xWDG
// Issue:   #8 (File System Functions)
// Prefix:  PFFS

import Foundation

/// PHPFramework
///
/// A Swift framework inspired by some PHP Functions.
extension PHPFramework {

	/// Returns trailing name component of path (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func basename(_ fh: String) -> String {
		return URL(fileURLWithPath: fh).lastPathComponent
	}

	/// Changes file group (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func chgrp(_ fh: String) -> Bool {
		print("Not done")

		return false
	}

	/// Changes file mode (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func chmod(_ fh: String) -> Bool {
		print("Not done")

		return false
	}

	/// Changes file owner (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func chown(_ fh: String) -> Bool {
		print("Not done")

		return false
	}

	/// Clears file status cache (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func clearstatcache(_ fh: String) -> Bool {
		print("Not done")

		return false
	}

	/// Copies file (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func copy(_ fh: String) -> Bool {
		print("Not done")

		return false
	}

	/// See unlink or unset (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func delete(_ fh: String) -> Bool {
		print("Not done")

		return false
	}

	/// Returns a parent directory's path (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func dirname(_ fh: String) -> String {
		return URL(fileURLWithPath: fh).deletingLastPathComponent().path
	}

	/// Returns available space on filesystem or disk partition
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
    public func disk_free_space(_ fh: String? = "") -> Int64? {
        let attrs = try? FileManager.default.attributesOfFileSystem(forPath: filesystemPath(fh))
        return (attrs?[.systemFreeSize] as? NSNumber)?.int64Value
    }

	/// Returns the total size of a filesystem or disk partition
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func disk_total_space(_ fh: String? = "") -> Int64? {
		let attrs = try? FileManager.default.attributesOfFileSystem(forPath: filesystemPath(fh))
		return (attrs?[.systemSize] as? NSNumber)?.int64Value
	}

	/// Alias of ``disk_free_space(_:)``
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func diskfreespace(_ fh: String? = "") -> Int64? {
		return disk_free_space(fh)
	}

	/// Closes an open file pointer (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func fclose(_ fh: String) -> Bool {
		print("Not done")

		return false
	}

	/// Tests for end-of-file on a file pointer (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func feof(_ fh: String) -> Bool {
		print("Not done")

		return false
	}

	/// Flushes the output to a file (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func fflush(_ fh: String) -> Bool {
		print("Not done")

		return false
	}

	/// Gets character from file pointer (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func fgetc(_ fh: String) -> String {
		print("Not done")

		return "Not done"
	}

	/// Gets line from file pointer and parse for CSV fields (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func fgetcsv(_ fh: String) -> String {
		print("Not done")

		return "Not done"
	}

	/// Gets line from file pointer (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func fgets(_ fh: String) -> String {
		print("Not done")

		return "Not done"
	}

	/// Gets line from file pointer and strip HTML tags (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func fgetss(_ fh: String) -> String {
		print("Not done")

		return "Not done"
	}

	/// Checks whether a file or directory exists (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func file_exists(_ fh: String) -> Bool {
		return FileManager.default.fileExists(atPath: fh)
	}

	/// Reads entire file into a string (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func file_get_contents(_ fh: String) -> String {
		return (try? String(contentsOfFile: fh, encoding: .utf8)) ?? ""
	}

	/// Write a string to a file (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func file_put_contents(_ fh: String) -> Bool {
		return file_put_contents(fh, "")
	}

	/// Write a string to a file.
	public func file_put_contents(_ fh: String, _ contents: String) -> Bool {
		do {
			try contents.write(toFile: fh, atomically: true, encoding: .utf8)
			return true
		} catch {
			return false
		}
	}

	/// Reads entire file into an array (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func file(_ fh: String) -> String {
		return file_get_contents(fh)
	}

	/// Reads entire file into an array of lines.
	public func file_lines(_ fh: String) -> [String] {
		return file_get_contents(fh).components(separatedBy: .newlines).filter { !$0.isEmpty }
	}

	/// Gets last access time of file (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func fileatime(_ fh: String) -> String {
		return filesystemAttribute(fh, .modificationDate)
	}

	/// Gets inode change time of file (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func filectime(_ fh: String) -> String {
		return filesystemAttribute(fh, .creationDate)
	}

	/// Gets file group (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func filegroup(_ fh: String) -> String {
		print("Not done")

		return "Not done"
	}

	/// Gets file inode (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func fileinode(_ fh: String) -> String {
		print("Not done")

		return "Not done"
	}

	/// Gets file modification time (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func filemtime(_ fh: String) -> String {
		return filesystemAttribute(fh, .modificationDate)
	}

	/// Gets file owner (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func fileowner(_ fh: String) -> String {
		print("Not done")

		return "Not done"
	}

	/// Gets file permissions (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func fileperms(_ fh: String) -> String {
		return filesystemAttribute(fh, .posixPermissions)
	}

	/// Gets file size (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func filesize(_ fh: String) -> String {
		return filesystemAttribute(fh, .size)
	}

	/// Gets file type (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func filetype(_ fh: String) -> String {
		var isDirectory = ObjCBool(false)
		guard FileManager.default.fileExists(atPath: fh, isDirectory: &isDirectory) else {
			return "unknown"
		}

		return isDirectory.boolValue ? "dir" : "file"
	}

	/// Portable advisory file locking (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func flock(_ fh: String) -> Bool {
		print("Not done")

		return false
	}

	/// Match filename against a pattern (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func fnmatch(_ fh: String) -> String {
		print("Not done")

		return "Not done"
	}

	/// Opens file or URL (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func fopen(_ fh: String) -> String {
		print("Not done")

		return fh
	}

	/// Output all remaining data on a file pointer (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func fpassthru(_ fh: String) -> Bool {
		print("Not done")

		return false
	}

	/// Format line as CSV and write to file pointer (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func fputcsv(_ fh: String) -> Bool {
		print("Not done")

		return false
	}

	/// Alias of ``fwrite(_:)``
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func fputs(_ fh: String) -> Bool {
		return fwrite(fh)
	}

	/// Binary-safe file read (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func fread(_ fh: String) -> String {
		return file_get_contents(fh)
	}

	/// Parses input from a file according to a format (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func fscanf(_ fh: String) -> String {
		print("Not done")

		return "Not done"
	}

	/// Seeks on a file pointer (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func fseek(_ fh: String) -> String {
		print("Not done")

		return "Not done"
	}

	/// Gets information about a file using an open file pointer (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func fstat(_ fh: String) -> String {
		print("Not done")

		return "Not done"
	}

	/// Returns the current position of the file read/write pointer (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func ftell(_ fh: String) -> String {
		print("Not done")

		return "Not done"
	}

	/// Truncates a file to a given length (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func ftruncate(_ fh: String) -> Bool {
		print("Not done")

		return false
	}

	/// Binary-safe file write (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func fwrite(_ fh: String) -> Bool {
		return file_put_contents(fh, "")
	}

	/// Binary-safe file write.
	public func fwrite(_ fh: String, _ contents: String) -> Bool {
		return file_put_contents(fh, contents)
	}

	/// Find pathnames matching a pattern (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func glob(_ fh: String) -> String {
		print("Not done")

		return "Not done"
	}

	/// Tells whether the filename is a directory (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func is_dir(_ fh: String) -> Bool {
		var isDirectory = ObjCBool(false)
		return FileManager.default.fileExists(atPath: fh, isDirectory: &isDirectory) && isDirectory.boolValue
	}

	/// Tells whether the filename is executable (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func is_executable(_ fh: String) -> Bool {
		return FileManager.default.isExecutableFile(atPath: fh)
	}

	/// Tells whether the filename is a regular file (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func is_file(_ fh: String) -> Bool {
		var isDirectory = ObjCBool(false)
		return FileManager.default.fileExists(atPath: fh, isDirectory: &isDirectory) && !isDirectory.boolValue
	}

	/// Tells whether the filename is a symbolic link (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func is_link(_ fh: String) -> Bool {
		let attrs = try? FileManager.default.attributesOfItem(atPath: fh)
		return attrs?[.type] as? FileAttributeType == .typeSymbolicLink
	}

	/// Tells whether a file exists and is readable (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func is_readable(_ fh: String) -> Bool {
		return FileManager.default.isReadableFile(atPath: fh)
	}

	/// Tells whether the file was uploaded via HTTP POST (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func is_uploaded_file(_ fh: String) -> Bool {
		print("Not done")

		return false
	}

	/// Tells whether the filename is writable (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func is_writeable(_ fh: String) -> Bool {
		return is_writable(fh)
	}

	/// is_writable
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func is_writable(_ fh: String) -> Bool {
		return FileManager.default.isWritableFile(atPath: fh)
	}

	/// Alias of ``is_writable(_:)``
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func iswriteable(_ fh: String) -> Bool {
		return is_writable(fh)
	}

	/// Changes group ownership of symlink (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func lchgrp(_ fh: String) -> Bool {
		print("Not done")

		return false
	}

	/// Changes user ownership of symlink (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func lchown(_ fh: String) -> Bool {
		print("Not done")

		return false
	}

	/// Create a hard link (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func link(_ fh: String) -> Bool {
		print("Not done")

		return false
	}

	/// Gets information about a link (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func linkinfo(_ fh: String) -> String {
		print("Not done")

		return "Not done"
	}

	/// Gives information about a file or symbolic link (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func lstat(_ fh: String) -> String {
		print("Not done")

		return "Not done"
	}

	/// Makes directory (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func mkdir(_ fh: String) -> Bool {
		return mkdir(fh, recursive: false)
	}

	/// Makes directory.
	public func mkdir(_ fh: String, recursive: Bool) -> Bool {
		do {
			try FileManager.default.createDirectory(
				atPath: fh,
				withIntermediateDirectories: recursive,
				attributes: nil
			)
			return true
		} catch {
			return false
		}
	}

	/// *Unsupported** Moves an uploaded file to a new location
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func move_uploaded_file(_ fh: String) -> Bool {
		print("Not done")

		return false
	}

	/// Parse a configuration file (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func parse_ini_file(_ fh: String) -> String {
		print("Not done")

		return "Not done"
	}

	/// Parse a configuration string (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func parse_ini_string(_ fh: String) -> String {
		print("Not done")

		return "Not done"
	}

	/// Returns information about a file path (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func pathinfo(_ fh: String) -> String {
		print("Not done")

		return "Not done"
	}

	/// Closes process file pointer (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func pclose(_ fh: String) -> String {
		print("Not done")

		return "Not done"
	}

	/// Opens process file pointer (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func popen(_ fh: String) -> String {
		print("Not done")

		return "Not done"
	}

	/// Outputs a file (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func readfile(_ fh: String) -> String {
		return file_get_contents(fh)
	}

	/// Returns the target of a symbolic link (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func readlink(_ fh: String) -> Bool {
		print("Not done")

		return false
	}

	/// Get realpath cache entries (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func realpath_cache_get(_ fh: String) -> Bool {
		print("Not done")

		return false
	}

	/// Get realpath cache size (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func realpath_cache_size(_ fh: String) -> Bool {
		print("Not done")

		return false
	}

	/// Returns canonicalized absolute pathname (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func realpath(_ fh: String) -> String {
		return URL(fileURLWithPath: fh).standardizedFileURL.path
	}

	/// Renames a file or directory (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func rename(_ fh: String) -> Bool {
		print("Not done")

		return false
	}

	/// Rewind the position of a file pointer (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func rewind(_ fh: String) -> Bool {
		print("Not done")

		return false
	}

	/// Removes directory (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func rmdir(_ fh: String) -> Bool {
		do {
			try FileManager.default.removeItem(atPath: fh)
			return true
		} catch {
			return false
		}
	}

	/// *Unsupported** stream_set_write_buffer
	///
	/// - Parameter fh: Any...
	///
	/// - Returns: false
	public func stream_set_write_buffer(_ fh: Any ...) -> Bool {
		return false
	}

	/// *Unsupported** Alias of ``stream_set_write_buffer(_:)``
	///
	/// - Parameter fh: Any...
	///
	/// - Returns: false
	public func set_file_buffer(_ fh: Any ...) -> Bool {
		return stream_set_write_buffer(fh)
	}

	/// Gives information about a file (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func stat(_ fh: String) -> String {
		print("Not done")

		return "Not done"
	}

	/// *Unsupported** Creates a symbolic link
	///
	/// - Parameter fh: String = ""
	/// - Parameter f2: String = ""
	///
	/// - Returns: false
	public func symlink(_ fh: String? = "", _ f2: String? = "") -> Bool {
		return false
	}

	/// Create file with unique file name (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func tempnam(_ fh: String) -> Bool {
		print("Not done")

		return false
	}

	/// Creates a temporary file (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func tmpfile(_ fh: String) -> Bool {
		print("Not done")

		return false
	}

	/// Sets access and modification time of file (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func touch(_ fh: String) -> Bool {
		if FileManager.default.fileExists(atPath: fh) {
			do {
				try FileManager.default.setAttributes([.modificationDate: Date()], ofItemAtPath: fh)
				return true
			} catch {
				return false
			}
		}

		return FileManager.default.createFile(atPath: fh, contents: Data(), attributes: nil)
	}

	/// Changes the current umask (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func umask(_ fh: String) -> String {
		print("Not done")

		return "Not done"
	}

	/// Deletes a file (**Not done**)
	///
	/// - Parameter fh: String
	///
	/// - Returns: Any
	public func unlink(_ fh: String) -> Bool {
		do {
			try FileManager.default.removeItem(atPath: fh)
			return true
		} catch {
			return false
		}
	}

	private func filesystemPath(_ fh: String?) -> String {
		if let fh, !fh.isEmpty {
			return fh
		}

		return FileManager.default.currentDirectoryPath
	}

	private func filesystemAttribute(_ path: String, _ key: FileAttributeKey) -> String {
		let attrs = try? FileManager.default.attributesOfItem(atPath: path)
		if let date = attrs?[key] as? Date {
			return String(Int(date.timeIntervalSince1970))
		}

		if let number = attrs?[key] as? NSNumber {
			return number.stringValue
		}

		return ""
	}
}
