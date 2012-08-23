window.config = {
    bosh_service: 'http://localhost:5280/http-bind/',
    registration: true,
    home_domain: "ds9.sf",
    anon_domain: "anon.ds9.sf",
    domain: "ds9.sf",
    topic_domain: "topics.ds9.sf",
    //directoryService: "search.buddycloud.org",
    store_credential_default: true,
    embedly_key:undefined,
    plugins: [],
    helpmail: "your-friendly-sysadmin@example.org",
};

/* text for the homepage */
window.config['homepage-text'] = "<h3>Welcome to Deep Space 9</h3>"
    + "<a href=\"http://en.memory-alpha.org/wiki/Deep_Space_9\"><img src=\"http://images1.wikia.nocookie.net/__cb20070105230455/memoryalpha/en/images/thumb/5/54/Deep_space_9.jpg/320px-Deep_space_9.jpg\"/></a>"
    + "<p>Deep Space 9, previously known as Terok Nor, is an orbital space station constructed by the Cardassians in orbit of Bajor."
    + "Several members of its command crew use buddycloud:</p>"
    + "<ul>"
    + "<li>Captain Benjamin Sisko (<strong>sisko@ds9.sf</strong>);</li>"
    + "<li>Constable Odo (<strong>odo@ds9.sf</strong>), chief of security, a changeling;</li>"
    + "<li>Lieutenant Commander Jadzia Dax (<strong>dax@ds9.sf</strong>), science officer, a Trill.</li>"
    + "</ul>"
    + "<p>Oddly, they all have the same password: <strong>abc123</strong>.</p>"
    + "<p>From this interface you can also contact:</p>"
    + "<ul>"
    + "<li>USS Enterprise: <strong>picard@enterprise.sf</strong>, <strong>data@enterprise.sf</strong>, <strong>laforge@enterprise.sf</strong></li>"
    + "<li>USS Voyager: <strong>janeway@voyager.sf</strong>, <strong>neelix@voyager.sf</strong>, and <strong>7of9@voyager.sf</strong></li>"
    + "</ul>"
    + "<p>Enjoy your trip, and as the Borg say: <i>Resistance is futile</i>.</p>";
