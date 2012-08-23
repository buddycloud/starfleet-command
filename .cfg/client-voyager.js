window.config = {
    bosh_service: 'http://localhost:5280/http-bind/',
    registration: true,
    home_domain: "voyager.sf",
    anon_domain: "anon.voyager.sf",
    domain: "voyager.sf",
    topic_domain: "topics.voyager.sf",
    //directoryService: "search.buddycloud.org",
    store_credential_default: true,
    embedly_key:undefined,
    plugins: [],
    helpmail: "your-friendly-sysadmin@example.org",
};

/* text for the homepage */
window.config['homepage-text'] = "<h3>Welcome to the USS Voyager</h3>"
    + "<a href=\"http://en.memory-alpha.org/wiki/USS_Voyager\"><img src=\"http://images1.wikia.nocookie.net/__cb20070320211146/memoryalpha/en/images/thumb/9/9f/Intrepid_class_top_quarter_aft.jpg/320px-Intrepid_class_top_quarter_aft.jpg\"/></a>"
    + "<p>The USS Voyager (NCC-74656) is an Intrepid-class Federation starship that somehow got lost in the Delta Quadrant for seven years. It has about 150 crewmembers, including:</p>"
    + "<ul>"
    + "<li>Captain Kathryn Janeway (<strong>janeway@voyager.sf</strong>);</li>"
    + "<li>Neelix (<strong>neelix@voyager.sf</strong>), cook, a Talaxian;</li>"
    + "<li>Seven of Nine (<strong>7of9@voyager.sf</strong>), astrometrics officer, a former Borg drone.</li>"
    + "</ul>"
    + "<p>Oddly, they all have the same password: <strong>abc123</strong>.</p>"
    + "<p>From this interface you can also contact:</p>"
    + "<ul>"
    + "<li>USS Enterprise: <strong>picard@enterprise.sf</strong>, <strong>data@enterprise.sf</strong>, <strong>laforge@enterprise.sf</strong></li>"
    + "<li>Deep Space 9: <strong>sisko@ds9.sf</strong>, <strong>odo@ds9.sf</strong> and <strong>dax@ds9.sf</strong></li>"
    + "</ul>"
    + "<p>Enjoy your trip, and as the Klingons say: <i>Qapla'!</i></p>";
