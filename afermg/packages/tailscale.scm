(define-module (afermg packages tailscale)
	       #:use-module (guix packages)
	       #:use-module (gnu packages linux)
	       #:use-module (guix gexp)
	       #:use-module (guix build-system copy)
	       #:use-module (guix download)
	       #:use-module (guix licenses))

(define-public tailscale
  (package
    (name "tailscale")
    (version "1.44.0")
    (source (origin
              (method url-fetch/tarbomb)
              (uri (string-append "https://pkgs.tailscale.com/stable/tailscale_" version
                                  "_amd64.tgz"))
              (sha256
               (base32
                "1kfxi9blvs2raws5k38bnlsf897nww7i4qa7fyizgbgmyis4l4kr"))))
    (build-system copy-build-system)
    (arguments
      (list
        #:install-plan
        #~`((,(string-append "tailscale_" #$version "_amd64/") "/usr/bin/"))))
    (propagated-inputs
      ; iptables is required for setting up routing
      (list iptables))
    (synopsis "Tailscale connects your team's devices and development environments for easy access to remote resources.")
    (description
     "Tailscale is a zero config VPN for building secure networks. Install on any device in minutes. Remote access from any network or physical location.")
    (home-page "https://tailscale.com/")
    (license #f)))
