window.config = {
    bosh_service: 'http://localhost:5280/http-bind/',
    registration: true,
    home_domain: "enterprise.sf",
    anon_domain: "anon.enterprise.sf",
    domain: "enterprise.sf",
    topic_domain: "topics.enterprise.sf",
    //directoryService: "search.buddycloud.org",
    store_credential_default: true,
    embedly_key:undefined,
    plugins: [],
    helpmail: "your-friendly-sysadmin@example.org",
};

/* text for the homepage */
window.config['homepage-text'] = "<h3>Welcome to the USS Enterprise</h3>"
    + "<a href=\"http://en.memory-alpha.org/wiki/USS_Enterprise_%28NCC-1701-D%29\"><img src=\"http://images2.wikia.nocookie.net/__cb20120313045242/memoryalpha/en/images/thumb/4/4b/USS_Enterprise-D%2C_These_Are_the_Voyages.jpg/320px-USS_Enterprise-D%2C_These_Are_the_Voyages.jpg\"/></a>"
    + "<p>The USS Enterprise (NCC-1701-D) is a Federation Galaxy-class explorer. It has 1,014 crewmembers, including:</p>"
    + "<ul>"
    + "<li>Captain Jean-Luc Picard (<strong>picard@enterprise.sf</strong>);</li>"
    + "<li>Lieutenant Commander Data (<strong>data@enterprise.sf</strong>), an android;</li>"
    + "<li>Lieutenant Commander Geordi La Forge (<strong>laforge@enterprise.sf</strong>), chief engineer.</li>"
    + "</ul>"
    + "<p>Oddly, they all have the same password: <strong>abc123</strong>.</p>"
    + "<p>From this interface you can also contact:</p>"
    + "<ul>"
    + "<li>Deep Space 9: <strong>sisko@ds9.sf</strong>, <strong>odo@ds9.sf</strong> and <strong>dax@ds9.sf</strong></li>"
    + "<li>USS Voyager: <strong>janeway@voyager.sf</strong>, <strong>neelix@voyager.sf</strong>, and <strong>7of9@voyager.sf</strong></li>"
    + "</ul>"
    + "<p>Enjoy your trip, and as the Vulcans say: <i>live long and prosper</i>.</p>";
