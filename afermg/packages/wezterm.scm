(define-module (afermg packages wezterm)
  #:use-module (gnu packages linux)
  ;; #:use-module (gnu packages gcc)
  #:use-module (gnu packages commencement)

  #:use-module (guix packages)
  #:use-module (guix gexp)
  #:use-module (guix build-system copy)
  ;; #:use-module (guix build-system cargo)

  #:use-module (guix download)
  ;; #:use-module (guix git-download)
  #:use-module (guix licenses))

(define-public wezterm
  (package
   (name "wezterm")
   (version "20240203-110809-5046fc22")
   (source (origin
            ;; (method git-fetch)
            ;; (uri ( git-reference
            ;;        (url "https://github.com/wez/wezterm.git")
            ;;        (commit version)))
            (method url-fetch)
            (uri (string-append "https://github.com/wez/wezterm/releases/download/" version "/wezterm-" version ".Ubuntu20.04.tar.xz"))
            (sha256
             (base32 "096j5vhb7cjk4mjbkqh6mmpi9iyyyalkajq3a7i0km6dadfi058x"))))
   ;; (base32 "1fyjj389kb8mblxfvg6b2wpajpxxjsw2mk51kwxsfn3hryrv66w6"))))
   (arguments
    (list
     #:validate-runpath? #f
     #:install-plan
     #~`((,(string-append "usr/bin/wezterm")"/bin/"))))
   ;; (build-system cargo-build-system)
   (build-system copy-build-system)


   ;; (propagated-inputs (list gcc-toolchain))
   (synopsis "Wezterm is a GPU-accelerated cross-platform terminal emulator and multiplexer written in Rust.")
   (description "Multiplex terminal panes, tabs and windows on local and remote hosts, with native mouse and scrollback. Ligatures, Color Emoji and font fallback, with true color and dynamic color schemes. Hyperlinks.")
   (home-page "https://wezfurlong.org/wezterm/")
   (license expat)))
wezterm
