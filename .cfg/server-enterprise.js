exports.xmpp = { jid: 'buddycloud.enterprise.sf',
                 password: 'sfc_p4ssw0rd', host: 'localhost', port: 5347 };
exports.modelBackend = 'postgres';
exports.modelConfig = { host: 'localhost', port: 5432,
    user: 'sfc', password: 'sfc_s3cr3t_p4ssw0rd', poolSize: 4,
    database: 'sfc_enterprise' };
exports.advertiseComponents = [ 'topics.enterprise.sf' ];
exports.defaults = {
    openUserChannel:true,
    closedTopicChannel:false,
};
exports.logging = {
    colorized: true,
    /* one of "FATAL", "ERROR", "WARN", "INFO", "DEBUG", "TRACE" */
    level: "TRACE",
    /* stdout: true, */
    file: "../log/buddycloud-enterprise.log"
};
exports.checkCreateNode = function(opts) {
    return (opts.nodeUser === opts.actor) ||
        (opts.nodeUser.split("@")[1] === "topics.enterprise.sf");
};
exports.autosubscribeNewUsers = [];
