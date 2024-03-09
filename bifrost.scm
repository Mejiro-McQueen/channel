(define-module (gnu packages)
  #:use-module (guix licenses)
  #:use-module (guix git-download)
  #:use-module (guix build-system asdf)
  #:use-module (gnu packages lisp)
  #:use-module (gnu packages lisp-xyz))

(define-public filesystem-hash-table
  (let ((commit "72bef342b8045846b6acba1e3615c3e9c3595ade")
        (revision "1"))
	(package
	 (name "filesystem-hash-table")
	 (version "0.0.1")
	 (source (origin
			  (method git-fetch)
			  (uri (git-reference
                    (url "https://github.com/Mejiro-McQueen/filesystem-hash-table.git")
                    (commit commit)))
              (file-name (git-file-name name version))
              (sha256
               (base32
                "1f3ambdgvr5wiwhdx19jfgmbvsn8xp87b5hivm1rwcbk264wwc3h"))))
	 (build-system asdf-build-system/sbcl)
	 (inputs
	  (list cl-alexandria))
	 (synopsis "A hashmap used to implement key searches in CCSDS XTCE")
     (description "A hashmap used to implement key searches in CCSDS XTCE")
     (home-page "https://github.com/Mejiro-McQueen/filesystem-hash-table")
     (license agpl3+))))

(define-public yggdrasill
  (let ((commit "aa72fa467f09be880de0e35b9d7b62366f84fd1d")
        (revision "1"))
	(package
	 (name "bifrost-yggdrasill")
	 (version "0.0.1")
	 (source (origin
			  (method git-fetch)
			  (uri (git-reference
                    (url "https://github.com/Mejiro-McQueen/Bifrost-Yggdrasill.git")
                    (commit commit)))
              ;;(file-name (git-file-name name version))
              (sha256
               (base32
                "17fn53wx0s81apvbvgqvz2x1cwhr6vrpfkzp6mhq01973yw8pww0"))))
	 (build-system asdf-build-system/sbcl)
	 (inputs
	  (list sbcl cl-cxml cl-log4cl cl-lparallel))
	 (propagated-inputs
	  (list filesystem-hash-table))
	 (synopsis "XTCE authoring and stream processing tools.")
     (description "This is an experimental DSL for authoring and validating XTCE. Future releases will utilize the DSL to create pipelines for processing of telemetry and telecommands.")
     (home-page "https://github.com/Mejiro-McQueen/Bifrost-Yggdrasill")
     (license agpl3+))))
