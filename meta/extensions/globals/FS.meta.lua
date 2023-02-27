---@meta FS

--- A path in the virtual file system (`FS`). Delimiter is `/`.
---@alias file-path string

--- A path in the operating system file system. Delimiter is OS dependent, `\` on Windows.
---@alias os-file-path string

--- A process exit code; by convention 0 means success, everything else means some kind of error.
---@alias exit-code integer

--- The BeamNG virtual file system.
---@class FS
FS = { }

--- Copies `src` to `dst`, overriding it if it already exists.
---@param src file-path The file to copy. Must be a regular file.
---@param dst file-path The name for the copy
---@return exit-code
function FS:copyFile(src, dst) end

--- Creates a new directory. The parent directory must exist.
---@param dir file-path The path for the new directory
---@return exit-code
function FS:directoryCreate(dir) end

--- Creates a new directory.
---@param dir file-path The path for the new directory
---@param recursively boolean Whether to create parent directories if needed. Fails otherwise if parent doesn't exist.
---@return exit-code
function FS:directoryCreate(dir, recursively) end

--- Returns whether the given path exists and is a directory.
---@param dir file-path The directory to test for existance
---@return boolean exists
function FS:directoryExists(dir) end

--- Lists all files and direcories in the given directory.
---@param dir file-path The directory to list the contents of
---@return file-path[] contents The contents of the directory, or an empty array if the path is not a directory
function FS:directoryList(dir) end

--- Lists entries in the given directory.
---@param dir file-path The directory to list the contents of
---@param listFiles boolean Whether to list regular files
---@param listDirs boolean Whether to list directories
---@return file-path[] contents The contents of the directory, or an empty array if the path is not a directory
function FS:directoryList(dir, listFiles, listDirs) end

--- Deletes the given directory and all its contents.
---@param dir file-path The directory to remove
---@return exit-code # Fails if the path did not exist
function FS:directoryRemove(dir) end

---@param filename string
---@return string
function FS:expandFilename(filename) end

--- Returns whether the given path exists and is a file.
---@param file file-path The file to test for existance
---@return boolean exists
function FS:fileExists(file) end

--- Returns the size of the given file, in bytes. If the file is a directory, the return value is undefined,
--- for some directories the OS directory header size is returned, for others 0.
---@param file file-path The file to get the size for
---@return uint bytes The size in bytes, or `0` if it does not exist
function FS:fileSize(file) end

--- Searches for files matching a pattern in the given directory recursively.
---@param dir file-path The directory to search
---@param filePattern string|'*' A 'simple' search pattern, for example `"*.lua"`
---@param searchDepth uint|-1 The number of subfolders to include recursively in the search
---@return file-path[] files The files found. If the directory doesn't exist, an empty array.
function FS:findFiles(dir, filePattern, searchDepth) end

--- Searches for files matching a pattern in the given directory recursively.
---@param dir file-path The directory to search
---@param filePattern string|'*' A 'simple' search pattern, for example `"*.lua"`
---@param searchDepth uint|-1 The number of subfolders to include recursively in the search
---@param maybeIncludeFilesNotWorking boolean Probably a flag to toggle files, but doesn't seem to work
---@param includeDirectories boolean Whether directories should be listed
---@return file-path[] files The files found. If the directory doesn't exist, an empty array.
function FS:findFiles(dir, filePattern, searchDepth, maybeIncludeFilesNotWorking, includeDirectories) end

---@param dir file-path
---@param filePattern string|'*'
---@param searchDepth uint|-1 The number of subfolders to include recursively in the search
---@param maybeIncludeFilesNotWorking boolean Probably a flag to toggle files, but doesn't seem to work
---@param includeDirectories boolean Whether directories should be listed
---@return file-path[] files The files found. If the directory doesn't exist, an empty array.
function FS:findFileByPattern(dir, filePattern, searchDepth, maybeIncludeFilesNotWorking, includeDirectories) end

---@param dir file-path
---@param filePattern string|'*'
---@param searchDepth uint|-1 The number of subfolders to include recursively in the search
---@param maybeIncludeFilesNotWorking boolean Probably a flag to toggle files, but doesn't seem to work
---@param includeDirectories boolean Whether directories should be listed
---@return file-path[] files The files found. If the directory doesn't exist, an empty array.
function FS:findFileByRootPattern(dir, filePattern, searchDepth, maybeIncludeFilesNotWorking, includeDirectories) end

--- Returns the real path to all mounted archives that can resolve the given path.
--- The first returned path points at the path that would be chosen by default.
---@param path file-path The path to find all overrides for
---@return os-file-path[] overrides All archives which override the given path
function FS:findOverrides(path) end

--- Returns the real path for the given path in the virtual file system
---@param path file-path The virtual file system path
---@return os-file-path realPath The os file path that the given given path resolves to
function FS:getFileRealPath(path) end

--- Returns the game installation directory.
---@return os-file-path gamePath The game installation directory
function FS:getGamePath() end

--- Returns the user directory; the directory that BeamNG can write in. On Windows
--- this is `%LocalAppdata%\BeamNG.drive\latest`.
---@return os-file-path userPath The writable directory
function FS:getUserPath() end

--- Computes a hash for the specified file.
---@param file file-path The file to hash
---@return string|'' hash The hash for the file encoded in hexadecimal, or an empty string of the path is not a file
function FS:hashFile(file) end

--- Computes a hash for the specified file using the SHA1 algorithm.
---@param file file-path The file to hash
---@return string|'' hash The hash for the file encoded in hexadecimal, or an empty string of the path is not a file
function FS:hashFileSHA1(file) end

---@return boolean
function FS:isGamePathCaseSensitive() end

--- Returns whether the given zip or directory is mounted to the virtual file system,
--- that is, it is a root for the virtual file system. The archive name must be in the same
--- case as when mounted, even if the real file is in a different case. Official BeamNG code
--- always mounts in full lowercase.
---@param archive file-path The zip or directory to test. Must bein the same case as when mounted
---@return boolean mounted Whether the given path is a directory or archive and is mounted
function FS:isMounted(archive) end

---@param path file-path
---@return boolean
function FS:isPathInCaseSensitiveMount(path) end

---@return boolean
function FS:isUserPathCaseSensitive() end

--- Returns all files that can be resolved by more than one mounted archive, mapped to all these
--- archives which can resolve them.
---@return table<file-path, os-file-path[]> overrides All files overridden mutliple times and by which archives
function FS:listOverrides() end

--- Mounts the given zip or directory to the virtual file system, that is, it marks it
--- as a root for file system paths. The case of the archive name in the path is irrelevant,
--- however, subsequently the same case has to be used to refer to this mount. Official BeamNG
--- code always mounts in lower case, thus it is recommended to follow this convention.
---@param archive os-file-path The zip or directory to mount
---@return exit-code exitcode Also succeeds if the given archive is already mounted
function FS:mount(archive) end

--- Mounts the given zip or directory to the virtual file system, that is, it marks it
--- as a root for file system paths. The case of the archive name in the path is irrelevant,
--- however, subsequently the same case has to be used to refer to this mount. Official BeamNG
--- code always mounts in lower case, thus it is recommended to follow this convention.
---@param archive os-file-path The zip or directory to mount
---@param mountPath string
---@return exit-code exitcode Also succeeds if the given archive is already mounted
function FS:mount(archive, mountPath) end

--- Mounts the given zip or directory to the virtual file system, that is, it marks it
--- as a root for file system paths. The case of the archive name in the path is irrelevant,
--- however, subsequently the same case has to be used to refer to this mount. Official BeamNG
--- code always mounts in lower case, thus it is recommended to follow this convention.
---@param archive os-file-path The zip or directory to mount
---@param mountPath string
---@param someNumber number
---@return exit-code exitcode Also succeeds if the given archive is already mounted
function FS:mount(archive, mountPath, someNumber) end

--- Executes multiple mounting instructions at once.
---@param mountList MountingInstruction[]
---@return boolean success If all and at least one mounting were successful
function FS:mountList(mountList) end

--- A mounting instruction.
---@class MountingInstruction
---@field srcPath os-file-path The zip or directory to mount
---@field mountPath string

--- Converts the given virtual file system path into an os path. If the path is inside
--- a zip archive, the path will treat the zip file as regular directory.
---@param path file-path The path to convert to a real path
---@return os-file-path|'' realPath The operating system's path the given path resolves to
function FS:native2Virtual(path) end

--- Deletes the given file or directory. If the file is a non-empty directory, the
--- directory contents will also be deleted.
---@param path file-path The file or directory to be deleted
---@return exit-code exitcode Successful also if the path didn't exist in the first place
function FS:remove(path) end

--- Deletes the given file.
---@param file file-path The file to be deleted
---@return exit-code exitcode Whether the file existed, was a regular file and is now deleted
function FS:removeFile(file) end

--- Moves ("renames") the given file to a different path, possibly in a different directory.
--- If the destrination file already exists, it will be overridden, if `dst` is a directory,
--- the operation fails. Does not work for directories.
---@param src file-path The file to be moved / renamed
---@param dst file-path What the file should be moved / renamed to
---@return exitcode
function FS:renameFile(src, dst) end

--- Returns information about the given file or directory. If the specified path points at
--- a symlink, the reported information is about the file pointed at.
---@param path file-path The file or directory to revieve information about
---@return FileInfo|{} stat Information about the given file or directory, if it exists
function FS:stat(path) end

--- Information about a file or directory.
---@class FileInfo
---@field accesstime timestamp The time of the last read access
---@field createtime timestamp The time of initial file creation
---@field filesize   uint The size of the file, in bytes. For directories this is sometimes the os directory header size, sometimes `0`.
---@field filetype   'file'|'dir' The type of the file. Symlinks report the information about the file pointed at
---@field modtime    timestamp The time of the last write access
---@field readonly   boolean Whether the file cannot be modified. This is for example the case for files in zip archives.

--- Notifies that files were changed. Does not actually trigger `onFilesChanged()`.
--- Do never call without any arguments, it will crash the game!
---@param files file-path[] The files to report as changed
function FS:triggerFilesChanged(files) end

--- Unmounts the given zip or directory. The case of the archive must be identical to the
--- case as which it was mounted; official BeamNG code always mounts in lowercase.
---@param archive file-path The zip or directory to unmount
---@return boolean success Also successful if the path points at an unrelated file, not succesful if the path does not exist
function FS:unmount(archive) end

function FS:updateDirectoryWatchers() end

--- Converts the given real path to a path in the virtual file system. Paths into zip
--- archives are _not_ supported.
---@param path os-file-path The real path to convert to a virtual file path
---@return file-path|'' vPath A virtual file system path that resolves to the same file or directory, or an empty string if the given path does not exist
function virtual2Native(path) end
