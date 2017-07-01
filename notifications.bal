import ballerina.net.http;
import ballerina.lang.messages;
import ballerina.lang.jsons;

@http:BasePath { value: "/notify"}
service notificationService {

    @http:POST {}
    resource rocketchat (message m) {
        string rc_url = "http://107.21.194.76:3000/hooks/";
        json m2 = messages:getJsonPayload(m);
        string rc_auth_token = jsons:getString(m2,"token");
        string rc_auth_url = rc_url+ rc_auth_token;
        http:ClientConnector rocketchat = create http:ClientConnector (rc_auth_url);
        message m3 = {};
        messages:setJsonPayload(m3,m2);
        message response = http:ClientConnector.post(rocketchat, "/", m3);
        reply response;
    }

    @http:POST {}
    resource sms (message m) {
        string clickatell_url = "https://api.clickatell.com/rest/message";
        json m2 = messages:getJsonPayload(m);
        string clickatell_token = jsons:getString(m2,"token");
        string clickatell_auth = "Bearer "+ clickatell_token;
        http:ClientConnector clickatell = create http:ClientConnector (clickatell_url);
        message m3 = {};
        messages:setHeader(m3,"X-Version","1");
        messages:setHeader(m3,"Content-Type","application/json");
        messages:setHeader(m3,"Authorization",clickatell_auth);
        messages:setHeader(m3,"Accept","application/json");
        messages:setJsonPayload(m3,m2);
        message response = http:ClientConnector.post(clickatell, "/", m3);
        reply response;
    }
}

