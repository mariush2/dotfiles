function generateazureprompturl
    echo "Enter tenantID: (leave blank for Equinor tenantID)"
    read tenantID
    echo "Enter ClientID: "
    read clientid
    if test "$clientid" = ""
        echo "clientid not set!"
        exit 1
    end
    echo "Enter resourceID: (uses \$id./default as scope with)"
    read resourceID
    if test "$resourceID" = ""
        echo "resourceID not set!"
        exit 1
    end
    echo "Enter redirect_uri: (leave blank for 'http://localhost:3000')"
    read redirect_uri

    if test $tenantID = ""
        set -f tenantID "<default-tenant-id>"
    else
        echo "tenantID was manually set, using $tenantID as tenantID"
    end

    if test $redirect_uri = ""
        set -f redirect_uri "http://localhost:3000"
    else
        echo "redirect_uri was manually set, using $redirect_uri as redirect_uri"
    end

    echo "YOUR AZURE REQUEST ACCESS PROMPT URL:"
    echo "login.microsoftonline.com/$tenantID/oauth2/v2.0/authorize?client_id=$clientid&redirect_uri=$redirect_uri&response_mode=form_post&response_type=code&scope=$resourceID/.default&state=12345&prompt=consent"
end