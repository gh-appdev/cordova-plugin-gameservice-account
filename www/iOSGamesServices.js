var gameServiceAccount = {
    auth: function (successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "GameCenter", "auth", []);
    }
}

if (!window.plugins) { window.plugins = {}; }

window.plugins.gameServiceAccount = gameServiceAccount;
return window.plugins.gameServiceAccount;