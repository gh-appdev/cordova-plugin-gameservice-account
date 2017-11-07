var gameServiceAccount = {
    auth: function (successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "GooglePlayGame", "auth", []);
    },
    showPlayer: function (successCallback, errorCallback) {
        cordova.exec(successCallback, errorCallback, "GooglePlayGame", "showPlayer", []);
    }
}

if (!window.plugins) { window.plugins = {}; }

window.plugins.gameServiceAccount = gameServiceAccount;
return window.plugins.gameServiceAccount;
