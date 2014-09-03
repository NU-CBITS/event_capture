;(function() {
  'use strict';

  function EventCaptureClient(serverUrl) {
    this.serverUrl = serverUrl;
  }

  EventCaptureClient.prototype.log = function(payload) {
    var data = {
      payload: payload,
      emittedAt: (new Date()).toISOString()
    };

    return $.ajax({
      type: 'POST',
      url: this.serverUrl,
      data: data
    });
  };

  window.EventCaptureClient = EventCaptureClient;
})();
