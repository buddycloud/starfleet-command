exports.xmpp = { jid: 'buddycloud.ds9.sf',
                 password: 'sfc_p4ssw0rd', host: 'localhost', port: 5347 };
exports.modelBackend = 'postgres';
exports.modelConfig = { host: 'localhost', port: 5432,
    user: 'sfc', password: 'sfc_s3cr3t_p4ssw0rd', poolSize: 4,
    database: 'sfc_ds9' };
exports.advertiseComponents = [ 'topics.ds9.sf' ];
exports.defaults = {
    openUserChannel:true,
    closedTopicChannel:false,
};
exports.logging = {
    colorized: true,
    /* one of "FATAL", "ERROR", "WARN", "INFO", "DEBUG", "TRACE" */
    level: "TRACE",
    /* stdout: true, */
    file: "../log/buddycloud-ds9.log"
};
exports.checkCreateNode = function(opts) {
    return (opts.nodeUser === opts.actor) ||
        (opts.nodeUser.split("@")[1] === "topics.ds9.sf");
};
exports.autosubscribeNewUsers = [];
