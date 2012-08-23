exports.xmpp = { jid: 'buddycloud.voyager.sf',
                 password: 'sfc_p4ssw0rd', host: 'localhost', port: 5347 };
exports.modelBackend = 'postgres';
exports.modelConfig = { host: 'localhost', port: 5432,
    user: 'sfc', password: 'sfc_s3cr3t_p4ssw0rd', poolSize: 4,
    database: 'sfc_voyager' };
exports.advertiseComponents = [ 'topics.voyager.sf' ];
exports.defaults = {
    openUserChannel:true,
    closedTopicChannel:false,
};
exports.logging = {
    colorized: true,
    /* one of "FATAL", "ERROR", "WARN", "INFO", "DEBUG", "TRACE" */
    level: "TRACE",
    /* stdout: true, */
    file: "../log/buddycloud-voyager.log"
};
exports.checkCreateNode = function(opts) {
    return (opts.nodeUser === opts.actor) ||
        (opts.nodeUser.split("@")[1] === "topics.voyager.sf");
};
exports.autosubscribeNewUsers = [];
