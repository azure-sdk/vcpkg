(require 'cl-lib)
(require 'yekneb-constants)
(require 'yekneb-debug)
(require 'yekneb-env)
(require 'yekneb-path-manip)

(defconst vcpkg--add-to-path-windows
  '(
    "${VCPKG_ROOT}/downloads/tools/cmake-3.29.0-windows/cmake-3.29.0-windows-i386/bin"
    "${VCPKG_ROOT}/downloads/tools/jom/jom-1_1_4"
    "${VCPKG_ROOT}/downloads/tools/nasm/nasm-2.16.01"
    "${VCPKG_ROOT}/downloads/tools/perl/5.38.0.1/c/bin"
    "${VCPKG_ROOT}/downloads/tools/perl/5.38.0.1/c/i686-w64-mingw32/bin"
    "${VCPKG_ROOT}/downloads/tools/perl/5.38.0.1/perl/site/bin"
    "${VCPKG_ROOT}/downloads/tools/perl/5.38.0.1/perl/bin"
    "${VCPKG_ROOT}/downloads/tools/python/python-3.11.8-${Platform}"
    "${VCPKG_ROOT}/installed/${Platform}-windows/bin"
    "${VCPKG_ROOT}/installed/${Platform}-windows/tools"
   )
  "Directories to add to the path for Windows."
 )

(defconst vcpkg--add-to-path-linux
  '(
    "${VCPKG_ROOT}/downloads/tools/cmake-3.29.0-linux/cmake-3.29.0-linux-x86_64/bin"
    "${VCPKG_ROOT}/downloads/tools/ninja/1.10.2-linux"
    "${VCPKG_ROOT}/installed/${Platform}-linux/tools"
    )
  "Directories to add to the path for Linux."
  )

(defun update-environment-for-vcpkg-windows ()
  "Updates the environment for VCPKG on Windows."
  (let
    (
     (yekneb-debug-level (if init-file-debug yekneb-log-debug yekneb-log-entry))
     (load-file-dir (file-name-directory load-file-name))
     (platform nil)
     (tool-dirs nil)
     (tools-dir "${VCPKG_ROOT}/installed/${Platform}-windows/tools")
     (poedit-dirs
      '(
        "${ProgramFiles(x86)}/Poedit"
        "${ProgramFiles(x86)}/Poedit/GettextTools/bin"
        )
      )
     )
    (setq
     platform
     (cond
      (yekneb-32-bit-system-p
       "x86"
       )
      (yekneb-64-bit-system-p
       "x64"
       )
      (t
       nil)
      )
     )
    (when platform
      (yekneb-log yekneb-log-info "Setting Platform to '%s'." platform)
      (yekneb-setenv "Platform" platform)
      )
    (setq tools-dir (substitute-env-vars tools-dir))
    (yekneb-log yekneb-log-info "tools-dir is '%s'." tools-dir)
    (yekneb-log yekneb-log-info "Adding the directories in vcpkg--add-to-path-windows to the path.")
    (yekneb-add-dirs-to-path vcpkg--add-to-path-windows t t load-file-dir)
    (yekneb-log yekneb-log-info "Adding the directories in tool-dirs to the path.")
    (when (file-directory-p tools-dir)
      (setq tool-dirs (directory-files tools-dir))
      (dolist (tool-dir tool-dirs)
        (when (and (not (string= tool-dir ".")) (not (string= tool-dir "..")))
          (setq tool-dir (expand-file-name tool-dir tools-dir))
          (when (file-directory-p tool-dir)
            (yekneb-add-to-path tool-dir t)
            )
          (setq tool-dir (expand-file-name "bin" tool-dir))
          (when (file-directory-p tool-dir)
            (yekneb-add-to-path tool-dir t)
            )
          )
        )
      )
    (yekneb-log yekneb-log-info "Adding the directories in poedit-dirs to the path.")
    (yekneb-add-dirs-to-path poedit-dirs t t load-file-dir)
    )
  )

(defun update-environment-for-vcpkg-linux ()
  "Updates the environment for VCPKG on Linux."
  (let
    (
     (yekneb-debug-level (if init-file-debug yekneb-log-debug yekneb-log-entry))
     (load-file-dir (file-name-directory load-file-name))
     (platform nil)
     (tool-dirs nil)
     (tools-dir "${VCPKG_ROOT}/installed/${Platform}-linux/tools")
     )
    (setq
     platform
     (cond
      (yekneb-32-bit-system-p
       "x86"
       )
      (yekneb-64-bit-system-p
       "x64"
       )
      (t
       nil)
      )
     )
    (when platform
      (yekneb-log yekneb-log-info "Setting Platform to '%s'." platform)
      (yekneb-setenv "Platform" platform)
      )
    (setq tools-dir (substitute-env-vars tools-dir))
    (yekneb-log yekneb-log-info "tools-dir is '%s'." tools-dir)
    (yekneb-log yekneb-log-info "Adding the directories in vcpkg--add-to-path-linux to the path.")
    (yekneb-add-dirs-to-path vcpkg--add-to-path-linux t t load-file-dir)
    (yekneb-log yekneb-log-info "Adding the directories in tool-dirs to the path.")
    (when (file-directory-p tools-dir)
      (setq tool-dirs (directory-files tools-dir))
      (dolist (tool-dir tool-dirs)
        (when (and (not (string= tool-dir ".")) (not (string= tool-dir "..")))
          (setq tool-dir (expand-file-name tool-dir tools-dir))
          (when (file-directory-p tool-dir)
            (yekneb-add-to-path tool-dir t)
            )
          (setq tool-dir (expand-file-name "bin" tool-dir))
          (when (file-directory-p tool-dir)
            (yekneb-add-to-path tool-dir t)
            )
          )
        )
      )
    )
  )

(defun update-environment-for-vcpkg ()
  "Updates the environment for VCPKG."
  (when (eq system-type 'windows-nt)
    (update-environment-for-vcpkg-windows)
    )
  (when (eq system-type 'gnu/linux)
    (update-environment-for-vcpkg-linux)
    )
  )

(update-environment-for-vcpkg)
